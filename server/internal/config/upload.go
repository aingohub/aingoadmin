package config

type Upload struct {
	Local      Local      `toml:"local"`
	Qiniu      Qiniu      `toml:"qiniu"`
	AliyunOSS  AliyunOSS  `toml:"aliyun-oss"`
	HuaWeiObs  HuaWeiObs  `toml:"hua-wei-obs"`
	TencentCOS TencentCOS `toml:"tencent-cos"`
	AwsS3      AwsS3      `toml:"aws-s3"`
}

type Local struct {
	Path      string `toml:"path"`       // 本地文件访问路径
	StorePath string `toml:"store-path"` // 本地文件存储路径
}

type Qiniu struct {
	Zone          string `toml:"zone"`            // 存储区域
	Bucket        string `toml:"bucket"`          // 空间名称
	ImgPath       string `toml:"img-path"`        // CDN加速域名
	UseHTTPS      bool   `toml:"use-https"`       // 是否使用https
	AccessKey     string `toml:"access-key"`      // 秘钥AK
	SecretKey     string `toml:"secret-key"`      // 秘钥SK
	UseCdnDomains bool   `toml:"use-cdn-domains"` // 上传是否使用CDN上传加速
}

type AliyunOSS struct {
	Endpoint        string `toml:"endpoint"`
	AccessKeyId     string `toml:"access-key-id"`
	AccessKeySecret string `toml:"access-key-secret"`
	BucketName      string `toml:"bucket-name"`
	BucketUrl       string `toml:"bucket-url"`
	BasePath        string `toml:"base-path"`
}

type HuaWeiObs struct {
	Path      string `toml:"path"`
	Bucket    string `toml:"bucket"`
	Endpoint  string `toml:"endpoint"`
	AccessKey string `toml:"access-key"`
	SecretKey string `toml:"secret-key"`
}
type TencentCOS struct {
	Bucket     string `toml:"bucket"`
	Region     string `toml:"region"`
	SecretID   string `toml:"secret-id"`
	SecretKey  string `toml:"secret-key"`
	BaseURL    string `toml:"base-url"`
	PathPrefix string `toml:"path-prefix"`
}

type AwsS3 struct {
	Bucket           string `toml:"bucket"`
	Region           string `toml:"region"`
	Endpoint         string `toml:"endpoint"`
	S3ForcePathStyle bool   `toml:"s3-force-path-style"`
	DisableSSL       bool   `toml:"disable-ssl"`
	SecretID         string `toml:"secret-id"`
	SecretKey        string `toml:"secret-key"`
	BaseURL          string `toml:"base-url"`
	PathPrefix       string `toml:"path-prefix"`
}
