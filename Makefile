APPLICATION_NAME := hello

PROJECT_ROOT := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
BUILD_DIRECTORY := build
BUILD_ROOT := $(PROJECT_ROOT)/$(BUILD_DIRECTORY)

.PHONY: build
build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $(BUILD_ROOT)/$(APPLICATION_NAME) -x $(PROJECT_ROOT)/cmd/$(APPLICATION_NAME)

.PHONY: test
test:
	go test -race -covermode=atomic ./...

.PHONY: docker
docker: build
	docker image build .