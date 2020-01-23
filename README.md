# docker-ce-build

## Trouble Shooting

### Buildkit Error

**Description:**
`DOCKER_BUILDKIT=1 docker build  --build-arg GO_IMAGE=golang:1.12.15-stretch --build-arg COMMON_FILES=common -t debbuild-debian-stretch/x86_64 -f /home/travis/build/Unicamp-OpenPower/docker-ce-build/docker-ce/components/packaging/deb/debian-stretch/Dockerfile .
buildkit not supported by daemon
Makefile:71: recipe for target 'debian-stretch' failed
make: *** [debian-stretch] Error 1`