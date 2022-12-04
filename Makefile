ARCH ?= amd64
TAG ?= 2
IMAGE ?= thomseddon/traefik-forward-auth

format:
	gofmt -w -s internal/*.go internal/provider/*.go cmd/*.go

test:
	go test -v ./...

docker:
	docker buildx build --push --platform=linux/$(ARCH) -f Dockerfile -t $(IMAGE):$(TAG) .

docker-all:
	docker buildx build --push --platform=linux/amd64,linux/arm,linux/arm64 -f Dockerfile -t $(IMAGE):$(TAG) .

.PHONY: format test docker docker-all
