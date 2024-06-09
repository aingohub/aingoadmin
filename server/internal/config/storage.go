package config

type Redis struct {
	Addr     string
	Username string
	Password string
	DB       int
}
type Storage struct {
	Cache struct {
		Type      string `toml:"type" default:"memory"` // memory/badger/redis
		Delimiter string `toml:"delimiter" default:":"` // delimiter for key
		Memory    struct {
			CleanupInterval int `toml:"cleanup-interval" default:"60"` // seconds
		} `toml:"memory"`
		Badger struct {
			Path string `toml:"path" default:"runtime/cache"`
		} `toml:"badger"`
		Redis Redis `toml:"redis"`
	} `toml:"cache"`

	MySQL struct {
		Read struct {
			Addr string `toml:"addr"`
			User string `toml:"user"`
			Pass string `toml:"pass"`
			Name string `toml:"name"`
		} `toml:"read"`
		Write struct {
			Addr string `toml:"addr"`
			User string `toml:"user"`
			Pass string `toml:"pass"`
			Name string `toml:"name"`
		} `toml:"write"`
	} `toml:"mysql"`

	Mongo struct {
		URI        string `toml:"uri"`
		UserName   string `toml:"username"`
		Password   string `toml:"password"`
		AuthSource string `toml:"authSource"`
	} `toml:"mongo"`
}
