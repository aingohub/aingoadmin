.PHONY: start build serve serve-d stop

NOW = $(shell date -u '+%Y%m%d%I%M%S')

RELEASE_VERSION = v0.0.1

APP 			= gin-api-mono
SERVER_BIN  	= ./bin/${APP}.exe
GIT_COUNT 		= $(shell git rev-list --all --count)
GIT_HASH        = $(shell git rev-parse --short HEAD)
RELEASE_TAG     = $(RELEASE_VERSION).$(GIT_COUNT).$(GIT_HASH)

CONFIG_DIR       = ./configs
CONFIG_FILES     = dev
STATIC_DIR       = ./build/dist
START_ARGS       = -d $(CONFIG_DIR) -c $(CONFIG_FILES) -s $(STATIC_DIR)

all: start

start:
	@go run -ldflags "-X main.VERSION=$(RELEASE_TAG)" main.go start $(START_ARGS)

build:
	@go build -ldflags "-w -s -X main.VERSION=$(RELEASE_TAG)" -o $(SERVER_BIN)

clean:
	rm -rf data $(SERVER_BIN)

serve: build
	./$(SERVER_BIN) start $(START_ARGS)

serve-d: build
	./$(SERVER_BIN) start $(START_ARGS) -d

stop:
	./$(SERVER_BIN) stop

.PHONY: error
error:
	./cmd/gen_error/gen-error.exe -c "./manifest/develop/gen-error.config.json"

.PHONY: gen-error
gen-error:
	@cmd /c call ./scripts/build_protos_error.bat;

.PHONY: model
model:
	./cmd/gorm-gen/gen-model.exe -c "./manifest/develop/gen-model.config.json"

.PHONY: air
air:
	air -c ./manifest/develop/air.toml start

.PHONY: gen-api
gen-api:
	@cmd /c call "./scripts/handlergen.bat" $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))