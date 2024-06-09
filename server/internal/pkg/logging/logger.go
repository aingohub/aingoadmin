package logging

import (
	"fmt"

	"gin-api-mono/internal/config"
	logger2 "gin-api-mono/internal/pkg/logger"
	"gin-api-mono/internal/pkg/timeutil"
)

var logPath = fmt.Sprintf("%s%s-debug.log", config.C.General.LogDir, config.C.General.ProjectName)

func Error(format string, args ...interface{}) {
	errLogger, err := logger2.NewJSONLogger(
		logger2.WithErrorLevel(),
		logger2.WithOutputInConsole(),
		logger2.WithField("domain", fmt.Sprintf("%s[%s]", config.C.General.ProjectName, fmt.Sprintf(format, args...))),
		logger2.WithTimeLayout(timeutil.CSTLayout),
		logger2.WithFileP(logPath),
	)
	if err != nil {
		panic(err)
	}
	defer func() {
		_ = errLogger.Sync()
	}()
}
