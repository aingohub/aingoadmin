package admin

import (
	"encoding/json"
	"gin-api-mono/internal/response/errcode"
	"os"

	"gin-api-mono/internal/pkg/core"
)

type userInfoRequest struct{}

type userInfoResponse struct{}

// UserInfo 创建管理员
// @Summary 创建管理员
// @Description 创建管理员
// @Tags Backend.admin.userinfo
// @Accept application/x-www-form-urlencoded
// @Produce json
// @Param Request body userInfoRequest true "请求信息"
// @Success 200 {object} userInfoResponse
// @Failure 400 {object} code.Failure
// @Router /backend/admin/userinfo [get]
func (h *handler) UserInfo() core.HandlerFunc {
	return func(ctx core.Context) {
		var rse interface{}
		content, err := os.ReadFile("./manifest/develop/mock/user_info.json")
		if err != nil {
			ctx.AbortWithError(core.ErrCode(errcode.AdminDetailError).WithError(err))
			return
		}
		if err := json.Unmarshal(content, &rse); err != nil {
			ctx.AbortWithError(core.ErrCode(errcode.AdminDetailError).WithError(err))
		}
		ctx.Payload(rse)
	}
}
