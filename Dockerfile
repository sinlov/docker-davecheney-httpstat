# This dockerfile
# VERSION 1
# Author: bridgewwater
# dockerfile offical document https://docs.docker.com/engine/reference/builder/

# maintainer="https://github.com/bridgewwater/template-docker-golang-exec-build"

# https://hub.docker.com/_/golang/tags
FROM golang:1.19.2-buster as builder

WORKDIR /go/src/

RUN git clone https://github.com/davecheney/httpstat.git -b v1.1.0 --depth=1 github.com/davecheney/httpstat

# download deps before gobuild
# share gomod cache
RUN --mount=type=cache,id=gomod,target=/go/pkg/mod \
            go mod download -x
# directories are not shared
# builder-linux-amd64:/go/bin/app-amd64
# builder-linux-arm64:/go/bin/app-arm64

RUN --mount=type=cache,id=gomod,target=/go/pkg/mod \
  cd github.com/davecheney/httpstat && \
  CGO_ENABLED=0 \
  go build -v \
  -a \
  -installsuffix cgo \
  -ldflags '-w -s --extldflags "-static -fpic"' \
  -tags netgo \
  -o httpstat \
  main.go

# https://hub.docker.com/_/alpine
FROM alpine:latest

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}

RUN apk --no-cache add \
  ca-certificates mailcap curl \
  && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /app
WORKDIR /app

COPY --from=builder /go/src/github.com/davecheney/httpstat/httpstat .
ENTRYPOINT ["/app/httpstat"]
# CMD ["/httpstat", "--help"]