package handler

import (
	"context"

	"gin-api-mono/internal/services"
	"gin-api-mono/internal/services/dto"
)

type Admin struct {
}

func (n Admin) Login(c context.Context, in dto.LoginInp) (token dto.LoginRes, err error) {
	//TODO implement me
	panic("implement me")
}

func NewAdmin() *Admin {
	return &Admin{}
}

func init() {
	services.RegisterAdmin(NewAdmin())
}
