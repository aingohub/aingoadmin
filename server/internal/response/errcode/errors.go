package errcode

func (x *Error) Error() string {
	return x.Msg
}
