package admin

import (
	"gin-api-mono/internal/pkg/core"
)

type createRequest struct{}

type createResponse struct{}

// Create 创建管理员
// @Summary 创建管理员
// @Description 创建管理员
// @Tags Backend.admin
// @Accept application/x-www-form-urlencoded
// @Produce json
// @Param Request body createRequest true "请求信息"
// @Success 200 {object} createResponse
// @Failure 400 {object} code.Failure
// @Router /backend/admin [post]
func (h *handler) Create() core.HandlerFunc {
	return func(ctx core.Context) {
		// fmt
	}
}
