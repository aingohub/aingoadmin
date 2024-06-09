package main

import (
	"os"

	"gin-api-mono/cmd"

	"github.com/urfave/cli/v2"
)

// VERSION Usage: go build -ldflags "-X main.VERSION=x.x.x"
var VERSION = "v1.0.2"

// @BasePath /
func main() {
	app := cli.NewApp()
	app.Name = "gin-api-mono"
	app.Version = VERSION
	app.Usage = "基于GIN + GORM + Casbin 2.0的轻量级、灵活、优雅且功能齐全的RBAC脚手架"
	app.Commands = []*cli.Command{
		cmd.StartCmd(),
		cmd.StopCmd(),
		cmd.VersionCmd(VERSION),
	}
	err := app.Run(os.Args)
	if err != nil {
		panic(err)
	}
}
