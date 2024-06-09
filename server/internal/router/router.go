package router

import (
	"gin-api-mono/internal/api/backend/admin"
	"gin-api-mono/internal/api/backend/file"
	"gin-api-mono/internal/pkg/cachex"
	"gin-api-mono/internal/pkg/core"
	"gin-api-mono/internal/pkg/repository/mysql"

	"github.com/pkg/errors"
	"go.uber.org/zap"
)

func NewHTTPMux(logger *zap.Logger, cache cachex.Cacher) (core.Mux, error) {
	if logger == nil {
		return nil, errors.New("logger required")
	}

	if mysql.Conn == nil {
		return nil, errors.New("db required")
	}

	mux, err := core.New(logger,
		core.WithEnableCors(),
		core.WithEnableSwagger(),
		core.WithEnablePProf(),
	)

	if err != nil {
		panic(err)
	}
	// file
	fileHandler := file.New(logger, cache)

	// 示例 CURD，操作 mysql admin 表
	adminHandler := admin.New(logger, cache)

	// backend 需要签名验证，无需登录验证，无需 RBAC 权限验证
	backendPublic := mux.Group("/backend")
	{
		backendPublic.GET("/background-image", fileHandler.BackgroundImage())
	}

	adminRouter := mux.Group("/backend")
	{
		// 创建管理员
		adminRouter.POST("/admin", adminHandler.Create())
		adminRouter.GET("/admin/userinfo", adminHandler.UserInfo())

	}

	return mux, nil
}
