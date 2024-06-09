package config

type Middleware struct {
	CORS struct {
		Enable                 bool     `toml:"enable"`
		AllowAllOrigins        bool     `toml:"allow-all-origins"`
		AllowOrigins           []string `toml:"allow-origins"`
		AllowMethods           []string `toml:"allow-methods"`
		AllowHeaders           []string `toml:"allow-headers"`
		AllowCredentials       bool     `toml:"allow-credentials"`
		ExposeHeaders          []string `toml:"expose-headers"`
		MaxAge                 int      `toml:"max-age"`
		AllowWildcard          bool     `toml:"allow-wildcard"`
		AllowBrowserExtensions bool     `toml:"allow-browser-extensions"`
		AllowWebSockets        bool     `toml:"allow-websockets"`
		AllowFiles             bool     `toml:"allow-files"`
	} `toml:"cors"`
	Trace struct {
		SkippedPathPrefixes []string `toml:"skipped-path-prefixes"`
		RequestHeaderKey    string   `toml:"request-header-key" default:"X-Request-Id"`
		ResponseTraceKey    string   `toml:"response-trace-key" default:"X-Trace-Id"`
	} `toml:"trace"`
	Logger struct {
		SkippedPathPrefixes      []string `toml:"skipped-path-prefixes"`
		MaxOutputRequestBodyLen  int      `toml:"max-output-request-body-len" default:"4096"`
		MaxOutputResponseBodyLen int      `toml:"max-output-response-body-len" default:"1024"`
	} `toml:"logger"`
	Casbin struct {
		Disable             bool     `toml:"disable"`
		SkippedPathPrefixes []string `toml:"skipped-path-prefixes"`
		LoadThread          int      `toml:"load-thread" default:"2"`
		AutoLoadInterval    int      `toml:"auto-load-interval" default:"3"` // seconds
		ModelFile           string   `toml:"model-file" default:"rbac_model.conf"`
		GenPolicyFile       string   `toml:"gen-policy-file" default:"gen_rbac_policy.csv"`
	} `toml:"casbin"`
	Static struct {
		Dir string `toml:"dir"` // Static files directory (From command arguments)
	} `toml:"static"`
}
