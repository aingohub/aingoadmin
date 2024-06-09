package dto

type LoginInp struct {
	Username string `json:"username"` // 用户名
	Password string `json:"password"` // 密码
}

type LoginRes struct {
	Token string
}
