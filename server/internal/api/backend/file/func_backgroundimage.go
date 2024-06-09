package file

import (
	"encoding/json"

	"gin-api-mono/internal/pkg/core"
	"gin-api-mono/internal/pkg/httpclient"
	"gin-api-mono/internal/response/errcode"

	"github.com/gin-gonic/gin"
)

type backgroundImageRequest struct{}

type BingImage struct {
	URL string `json:"url"`
	// ... 其他字段 ...
}

type backgroundImageResponse struct {
	Images []BingImage `json:"images"`
}

// BackgroundImage 获取背景图片
// @Summary 获取背景图片
// @Description 获取背景图片
// @Tags Backend.background-image
// @Accept application/x-www-form-urlencoded
// @Produce json
// @Param Request body backgroundImageRequest true "请求信息"
// @Success 200 {object} backgroundImageResponse
// @Failure 400 {object} code.Failure
// @Router /backend/background-image [get]
func (h *handler) BackgroundImage() core.HandlerFunc {
	return func(ctx core.Context) {
		var rse = backgroundImageResponse{}
		urlBin := "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1"
		headers := map[string]string{
			"Content-Type": "application/json", // 虽然对于GET请求这不是必需的，但可以作为示例
		}
		client := httpclient.GetHttpClientWithContext(ctx.RequestContext())

		resp, err := client.R().SetHeaders(headers).Get(urlBin)
		if err != nil {
			ctx.AbortWithError(core.ErrCode(errcode.FileBackgroundImageFailure).WithError(err))
			return
		}
		err = json.Unmarshal(resp.Body(), &rse)
		if err != nil {
			ctx.AbortWithError(core.ErrCode(errcode.FileBackgroundImageFailure).WithError(err))
			return
		}
		ctx.Payload(gin.H{"url": "https://cn.bing.com" + rse.Images[0].URL})
	}
}
