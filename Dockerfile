# This dockerfile
# VERSION 1
# Author: bridgewwater
# dockerfile offical document https://docs.docker.com/engine/reference/builder/

# maintainer="https://github.com/bridgewwater/template-docker-golang-exec-build"

# https://hub.docker.com/_/golang/tags
FROM golang:1.19.2-buster as builder

WORKDIR /go/src/

RUN git clone https://github.com/davecheney/httpstat.git -b v1.1.0 --depth=1 github.com/davecheney/httpstat && \
  cd github.com/davecheney/httpstat && \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64 \
  go build -v \
  -a -installsuffix cgo \
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

COPY --from=builder /go/src/github.com/davecheney/httpstat/httpstat .
ENTRYPOINT ["./httpstat"]
# CMD ["./httpstat", "--help"]