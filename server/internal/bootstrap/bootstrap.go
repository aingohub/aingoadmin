package bootstrap

import (
	"context"
	"fmt"
	"net/http"
	"strings"
	"time"

	"gin-api-mono/internal/config"
	"gin-api-mono/internal/pkg/cachex"
	"gin-api-mono/internal/pkg/env"
	"gin-api-mono/internal/pkg/logger"
	"gin-api-mono/internal/pkg/repository/mysql"
	"gin-api-mono/internal/pkg/repository/redis"
	"gin-api-mono/internal/pkg/timeutil"
	"gin-api-mono/internal/router"
	_ "gin-api-mono/internal/services/handler"

	"go.uber.org/zap"
)

// RunConfig 定义运行命令的配置.
type RunConfig struct {
	WorkDir   string // 工作目录
	Configs   string // 运行时配置文件或目录(相对于工作目录，多个以逗号分隔)
	StaticDir string // 静态文件目录
	Env       string // 运行环境(dev:开发 fat:测试 uat:预发布 pro:生产)
}

// Run 函数初始化并启动具有配置和日志记录的服务，并在退出时处理清理.
func Run(ctx context.Context, runCfg RunConfig) error {
	// 初始化 运行环境
	env.Init(runCfg.Env)
	// 加载配置.
	workDir := runCfg.WorkDir
	staticDir := runCfg.StaticDir
	config.MustLoad(workDir, strings.Split(runCfg.Configs, ",")...)
	config.C.Middleware.Static.Dir = staticDir
	//config.C.Print()
	config.C.PreLoad()
	// 初始化 access logger
	accessLogPath := fmt.Sprintf("%s%s-access.log", config.C.General.LogDir, config.C.General.ProjectName)
	accessLogger, err := logger.NewJSONLogger(
		logger.WithOutputInConsole(),
		logger.WithField("domain", fmt.Sprintf("%s[%s]", config.C.General.ProjectName, env.Active().Value())),
		logger.WithTimeLayout(timeutil.CSTLayout),
		logger.WithFileP(accessLogPath),
	)

	if err != nil {
		panic(err)
	}

	defer func() {
		_ = accessLogger.Sync()
	}()

	// 初始化 MySQL
	err = mysql.New()
	if err != nil {
		panic(err)
	}

	// 初始化 Cache
	cfg := config.C.Storage.Cache
	var cache cachex.Cacher
	switch cfg.Type {
	case "redis":
		cache = cachex.NewRedisCacheWithClient(redis.GetRedisClient(), cachex.WithDelimiter(cfg.Delimiter))
	case "badger":
		cache = cachex.NewBadgerCache(cachex.BadgerConfig{
			Path: cfg.Badger.Path,
		}, cachex.WithDelimiter(cfg.Delimiter))
	default:
		cache = cachex.NewMemoryCache(cachex.MemoryConfig{
			CleanupInterval: time.Second * time.Duration(cfg.Memory.CleanupInterval),
		}, cachex.WithDelimiter(cfg.Delimiter))
	}

	// 初始化 HTTP 服务
	mux, err := router.NewHTTPMux(accessLogger, cache)
	if err != nil {
		panic(err)
	}

	server := &http.Server{
		Addr:    config.C.General.HTTP.Addr,
		Handler: mux,
	}
	go func() {
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			accessLogger.Fatal("http server startup err", zap.Error(err))
		}
	}()

	// 优雅关闭
	return _run(ctx, func(ctx context.Context) (func(), error) {
		return func() {
			// 关闭 http server
			if err := server.Shutdown(context.TODO()); err != nil {
				accessLogger.Error("server shutdown err", zap.Error(err))
			}

			// 关闭 db master (支持读写)
			if err := mysql.Conn.DbWClose(); err != nil {
				accessLogger.Error("dbw close err", zap.Error(err))
			}

			// 关闭 db slave (仅支持读)
			if err := mysql.Conn.DbRClose(); err != nil {
				accessLogger.Error("dbr close err", zap.Error(err))
			}

			// 关闭 cache
			if err := cache.Close(ctx); err != nil {
				accessLogger.Error("cache close err", zap.Error(err))
			}

		}, nil
	})
}
