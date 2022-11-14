# docker-davecheney-httpstat

![docker version semver](https://img.shields.io/docker/v/sinlov/docker-davecheney-httpstat?sort=semver)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/docker-davecheney-httpstat)](https://hub.docker.com/r/sinlov/docker-davecheney-httpstat)
[![docker pulls](https://img.shields.io/docker/pulls/sinlov/docker-davecheney-httpstat)](https://hub.docker.com/r/sinlov/docker-davecheney-httpstat/tags?page=1&ordering=last_updated)

- docker hub see [https://hub.docker.com/r/sinlov/docker-davecheney-httpstat](https://hub.docker.com/r/sinlov/docker-davecheney-httpstat)

## source repo

[https://github.com/sinlov/docker-davecheney-httpstat](https://github.com/sinlov/docker-davecheney-httpstat)

## useage

- use in docker

```bash
$ docker run --rm sinlov/docker-davecheney-httpstat:latest --help
```

- use as docker-exec

```bash
$ sudo curl -L --fail https://raw.githubusercontent.com/sinlov/docker-davecheney-httpstat/main/run.sh -o /usr/local/bin/httpstat
$ sudo chmod +x /usr/local/bin/httpstat
# then check
$ httpstat --help
# then check url like
$ httpstat https://www.google.com
```

## todo-list

- rename `sinlov/docker-davecheney-httpstat` to new github url
- rename `sinlov` to new org or user
- rename `docker-davecheney-httpstat` to new docker image name
- rename `httpstat` to new exec tools name
- add [secrets](https://github.com/sinlov/docker-davecheney-httpstat/settings/secrets/actions) `New repository secret` name `ACCESS_TOKEN` from [hub.docker](https://hub.docker.com/settings/security)
- go cli repo [https://github.com/davecheney/httpstat](https://github.com/davecheney/httpstat)

## fast dev

```bash
# then test build as test/Dockerfile
$ make dockerTestRestartLatest
# clean test build
$ make dockerTestPruneLatest
```

- just online use Dockerfile