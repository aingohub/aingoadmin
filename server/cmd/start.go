package cmd

import (
	"context"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"gin-api-mono/internal/bootstrap"

	"github.com/urfave/cli/v2"
)

// StartCmd The function defines a CLI command to start a server with various flags and options, including the
// ability to run as a daemon.
func StartCmd() *cli.Command {
	return &cli.Command{
		Name:  "start",
		Usage: "Start server",
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "workdir",
				Aliases:     []string{"w"},
				Usage:       "工作目录",
				DefaultText: "manifest",
				Value:       "manifest",
			},
			&cli.StringFlag{
				Name:        "config",
				Aliases:     []string{"c"},
				Usage:       "运行时配置文件或目录(相对于工作目录，多个以逗号分隔)",
				DefaultText: "configs",
				Value:       "configs",
			},
			&cli.StringFlag{
				Name:    "static",
				Aliases: []string{"s"},
				Usage:   "静态文件目录",
			},
			&cli.StringFlag{
				Name:    "env",
				Aliases: []string{"e"},
				Usage:   "运行环境(dev:开发 fat:测试 uat:预发布 pro:生产)",
				Value:   "fat",
			},
			&cli.BoolFlag{
				Name:    "daemon",
				Aliases: []string{"d"},
				Usage:   "作为守护进程运行",
			},
		},
		Action: func(c *cli.Context) error {
			workDir := c.String("workdir")
			staticDir := c.String("static")
			configs := c.String("config")
			env := c.String("env")

			fmt.Println("workDir", workDir)
			fmt.Println("configs", configs)
			fmt.Println("staticDir", staticDir)
			fmt.Println("env", env)
			if c.Bool("daemon") {
				bin, err := filepath.Abs(os.Args[0])
				if err != nil {
					fmt.Printf("failed to get absolute path for command: %s \n", err.Error())
					return err
				}

				args := []string{"start"}
				args = append(args, "-d", workDir)
				args = append(args, "-c", configs)
				args = append(args, "-s", staticDir)
				args = append(args, "-s", env)
				fmt.Printf("execute command: %s %s \n", bin, strings.Join(args, " "))
				command := exec.Command(bin, args...)
				err = command.Start()
				if err != nil {
					fmt.Printf("failed to start daemon thread: %s \n", err.Error())
					return err
				}

				pid := command.Process.Pid
				_ = os.WriteFile(fmt.Sprintf("%s.lock", c.App.Name), []byte(fmt.Sprintf("%d", pid)), 0666)
				fmt.Printf("service daemon thread started with pid %d \n", pid)
				os.Exit(0)
			}

			err := bootstrap.Run(context.Background(), bootstrap.RunConfig{
				WorkDir:   workDir,
				Configs:   configs,
				StaticDir: staticDir,
				Env:       env,
			})
			if err != nil {
				panic(err)
			}
			return nil
		},
	}
}
