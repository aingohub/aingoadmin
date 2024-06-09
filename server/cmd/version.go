package cmd

import (
	"fmt"

	"github.com/urfave/cli/v2"
)

// VersionCmd This function creates a CLI command that prints the version number.
func VersionCmd(v string) *cli.Command {
	return &cli.Command{
		Name:  "version",
		Usage: "显示版本",
		Action: func(_ *cli.Context) error {
			fmt.Println(v)
			return nil
		},
	}
}
