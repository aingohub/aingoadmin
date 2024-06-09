package config

type General struct {
	ProjectName         string `toml:"project-name" default:"gin-api-mono"`
	Version             string `toml:"version" default:"v1.0.2"`
	Debug               bool   `toml:"debug"`
	PprofAddr           string `toml:"pprof-addr"`
	DisableSwagger      bool   `toml:"disable-swagger"`
	DisablePrintConfig  bool   `toml:"disable-print-config"`
	DefaultLoginPwd     string `toml:"default-login-pwd" default:"6351623c8cef86fefabfa7da046fc619"` // MD5(abc-123)
	LogDir              string `toml:"log-dir" default:"./logs/"`
	DenyDeleteMenu      bool   `toml:"deny-delete-menu"`
	InstallMark         string `toml:"install-mark" default:"INSTALL.lock"`
	HeaderLoginToken    string `toml:"header-login-token" default:"Token"`
	HeaderSignToken     string `toml:"header-sign-token" default:"Authorization"`
	HeaderSignTokenDate string `toml:"header-sign-token-date" default:"Authorization-Date"`
	HTTP                HTTP   `toml:"http"`
	OssType             string `toml:"oss-type" default:"local"`
}

type HTTP struct {
	Addr            string `toml:"addr" default:":9999"`
	ShutdownTimeout int    `toml:"shutdown-timeout" default:"10"` // seconds
	ReadTimeout     int    `toml:"read-timeout" default:"60"`     // seconds
	WriteTimeout    int    `toml:"write-timeout" default:"60"`    // seconds
	IdleTimeout     int    `toml:"idle-timeout" default:"10"`     // seconds
	CertFile        string `toml:"cert-file"`
	KeyFile         string `toml:"key-file"`
}
