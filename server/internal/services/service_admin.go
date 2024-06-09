package services

import (
	"context"

	"gin-api-mono/internal/services/dto"
)

type (
	IAdmin interface {
		Login(c context.Context, in dto.LoginInp) (token dto.LoginRes, err error)
	}
)

var (
	localAdmin IAdmin
)

func Admin() IAdmin {
	if localAdmin == nil {
		panic("implement not found for interface IAuth, forgot register?")
	}
	return localAdmin
}

func RegisterAdmin(i IAdmin) {
	localAdmin = i
}
