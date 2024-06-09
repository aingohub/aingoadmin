@echo off
setlocal EnableDelayedExpansion

powershell -Command "Remove-Item -Recurse -Force internal/response/errcode -ErrorAction SilentlyContinue"

xcopy  "internal\proto_path\errcode\errors.go" "internal\response\errcode\" /S /E /Y /I > nul 2>&1

protoc --go-error-generator_out=:. --proto_path=internal/proto_path  --go-error-generator_opt descriptor_file=internal/response/errors.proto --go-error-generator_opt merge_error=false --go-error-generator_opt merge_error_path=internal/response/errcode --go_out=. -I . internal/response/errors.proto
