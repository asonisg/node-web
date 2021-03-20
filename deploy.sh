#!/bin/sh

set -e # Stop script from running if there are any errors

IMAGE="asoni/node-web2"                             # Docker image
GIT_VERSION=$(git describe --always --abbrev --tags --long) # Git hash and tags

# Build and tag image
docker build -t ${IMAGE}:${GIT_VERSION} .
docker tag ${IMAGE}:${GIT_VERSION} ${IMAGE}:latest

# Log in to Docker Hub and push
echo "redhat123" | docker login -u "asonisg" --password-stdin
docker push ${IMAGE}:${GIT_VERSION}
