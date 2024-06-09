package file

import (
	"gin-api-mono/internal/pkg/cachex"
	"gin-api-mono/internal/pkg/core"

	"go.uber.org/zap"
)

var _ Handler = (*handler)(nil)

type Handler interface {
	i()

	// BackgroundImage 获取背景图片
	// @Tags Backend.background-image
	// @Router /backend/background-image [post]
	BackgroundImage() core.HandlerFunc
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
