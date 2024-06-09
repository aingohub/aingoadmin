package admin

import (
	"gin-api-mono/internal/pkg/cachex"
	"gin-api-mono/internal/pkg/core"

	"go.uber.org/zap"
)

var _ Handler = (*handler)(nil)

type Handler interface {
	i()

	// Create 创建管理员
	// @Tags Backend.admin.create
	// @Router /backend/admin/create [post]
	Create() core.HandlerFunc

	// UserInfo 创建管理员
	// @Tags Backend.admin.userinfo
	// @Router /backend/admin/userinfo [get]
	UserInfo() core.HandlerFunc
}

type handler struct {
	logger *zap.Logger
	cache  cachex.Cacher
}

func New(logger *zap.Logger, cache cachex.Cacher) Handler {
	return &handler{
		logger: logger,
		cache:  cache,
	}
}

func (h *handler) i() {}
