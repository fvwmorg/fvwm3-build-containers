#!/bin/sh

DOCKER_LIBC_NAME="fvwmorg/fvwm3-build:latest"
DOCKER_MUSL_NAME="fvwmorg/fvwm3-build-alpine:latest"
DOCKER_MUSL_DOCKERFILE="Dockerfile-alpine"

DOCKER_NAME="$DOCKER_LIBC_NAME"
DOCKERFILE="Dockerfile"

[ -z "$1" ] && {
	echo "Not enough arguments, supply one of: 'libc', or 'musl'">&2
	exit 1
}

[ -n "$1" ] && [ "$1" = "musl" ] && {
	DOCKER_NAME="$DOCKER_MUSL_NAME"
	DOCKERFILE="$DOCKER_MUSL_DOCKERFILE"
}

docker build . --no-cache -t "$DOCKER_NAME" -f "$DOCKERFILE"
