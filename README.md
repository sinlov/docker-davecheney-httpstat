# docker-davecheney-httpstat

![docker version semver](https://img.shields.io/docker/v/sinlov/docker-davecheney-httpstat?sort=semver)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/docker-davecheney-httpstat)](https://hub.docker.com/r/sinlov/docker-davecheney-httpstat)
[![docker pulls](https://img.shields.io/docker/pulls/sinlov/docker-davecheney-httpstat)](https://hub.docker.com/r/sinlov/docker-davecheney-httpstat/tags?page=1&ordering=last_updated)

- docker hub see https://hub.docker.com/r/sinlov/docker-davecheney-httpstat

## source repo

[https://github.com/sinlov/docker-davecheney-httpstat](https://github.com/sinlov/docker-davecheney-httpstat)

## todo-list

- rename `sinlov/docker-davecheney-httpstat` to new github url
- rename `sinlov` to new org or user
- raname `docker-davecheney-httpstat` to new docker image name
- add [secrets](https://github.com/sinlov/docker-davecheney-httpstat/settings/secrets/actions) `New repository secret` name `ACCESS_TOKEN` from [hub.docker](https://hub.docker.com/settings/security)
- go cli repo [https://github.com/davecheney/httpstat](https://github.com/davecheney/httpstat)

## fast dev

```bash
$ make runContainerParentBuild

# then test build as test/Dockerfile
$ make testRestartLatest
# clean test build
$ make testPruneLatest
```

- just online use Dockerfile