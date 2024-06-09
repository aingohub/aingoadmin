package redis

import (
	"context"
	"errors"
	"log"
	"runtime"
	"strconv"
	"sync"
	"time"

	"gin-api-mono/internal/config"
	"gin-api-mono/internal/pkg/core"
	"gin-api-mono/internal/pkg/timeutil"
	"gin-api-mono/internal/pkg/trace"

	redisV9 "github.com/redis/go-redis/v9"
)

var (
	client *redisV9.Client
	once   sync.Once
)

type loggingHook struct {
	ts time.Time
}

func (h *loggingHook) DialHook(next redisV9.DialHook) redisV9.DialHook {
	return next
}

func (h *loggingHook) ProcessHook(next redisV9.ProcessHook) redisV9.ProcessHook {
	return func(ctx context.Context, cmd redisV9.Cmder) error {
		h.ts = time.Now()
		monoCtx, ok := ctx.(core.StdContext)
		if !ok {
			log.Println("redis hook AfterProcess ctx illegal")
			return errors.New("ctx illegal")
		}

		if monoCtx.Trace != nil {
			redisInfo := new(trace.Redis)
			redisInfo.Time = timeutil.CSTLayoutString()
			redisInfo.Stack = fileWithLineNum()
			redisInfo.Cmd = cmd.String()
			redisInfo.CostSeconds = time.Since(h.ts).Seconds()

			monoCtx.Trace.AppendRedis(redisInfo)
		}
		return next(ctx, cmd)
	}
}

func (h *loggingHook) ProcessPipelineHook(next redisV9.ProcessPipelineHook) redisV9.ProcessPipelineHook {
	return func(ctx context.Context, cmds []redisV9.Cmder) error {
		for _, cmd := range cmds {
			err := h.ProcessHook(nil)(ctx, cmd)
			if err != nil {
				return err
			}
		}
		return nil
	}
}

func GetRedisClient() *redisV9.Client {
	once.Do(func() {
		cfg := config.Get().Storage.Cache.Redis
		client = redisV9.NewClient(&redisV9.Options{
			Addr:         cfg.Addr,
			Username:     cfg.Username,
			Password:     cfg.Password,
			DB:           cfg.DB,
			MaxRetries:   3,
			DialTimeout:  time.Second * 5,
			ReadTimeout:  time.Second * 20,
			WriteTimeout: time.Second * 20,
			PoolSize:     50,
			MinIdleConns: 2,
			PoolTimeout:  time.Minute,
		})

		if err := client.Ping(context.Background()).Err(); err != nil {
			panic(err)
		}

		client.AddHook(&loggingHook{})

	})

	return client
}

func fileWithLineNum() string {
	_, file, line, ok := runtime.Caller(5)
	if ok {
		return file + ":" + strconv.FormatInt(int64(line), 10)
	}

	return ""
}
