package config

type Util struct {
	Captcha struct {
		Length    int    `toml:"length" default:"4"`
		Width     int    `toml:"width" default:"400"`
		Height    int    `toml:"height" default:"160"`
		CacheType string `toml:"cache-type" default:"memory"` // memory/redis
		Redis     struct {
			Addr      string `toml:"addr"`
			Username  string `toml:"username"`
			Password  string `toml:"password"`
			DB        int    `toml:"db"`
			KeyPrefix string `toml:"key-prefix" default:"captcha:"`
		} `toml:"redis"`
	} `toml:"captcha"`
	Prometheus struct {
		Enable         bool     `toml:"enable"`
		Port           int      `toml:"port" default:"9100"`
		BasicUsername  string   `toml:"basic-username" default:"admin"`
		BasicPassword  string   `toml:"basic-password" default:"admin"`
		LogApis        []string `toml:"log-apis"`
		LogMethods     []string `toml:"log-methods"`
		DefaultCollect bool     `toml:"default-collect"`
	} `toml:"prometheus"`

	JWT struct {
		Secret string `toml:"secret"`
	} `toml:"jwt"`

	AES struct {
		Secret string `toml:"secret"`
	} `toml:"aes"`

	RSA struct {
		PublicKey  string `toml:"public-key"`
		PrivateKey string `toml:"private-key"`
	} `toml:"rsa"`
}
