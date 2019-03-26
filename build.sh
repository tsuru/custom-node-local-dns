#!/bin/bash

set -e

git submodule update --init

rm -rf $(pwd)/build/src/k8s.io/dns/*
mkdir -p $(pwd)/build/src/k8s.io/dns
cp -a $(pwd)/.dns/* $(pwd)/build/src/k8s.io/dns/
cp extra/* $(pwd)/build/src/k8s.io/dns/cmd/node-cache

export TSURU_VERSION="${TAG:-latest}"
export VERSION="$(git -C .dns describe --tags)-tsuru-${TSURU_VERSION}"
export GOPATH=$(pwd)/build

pushd $(pwd)/build/src/k8s.io/dns
dep ensure -v
export VERBOSE=1
export REGISTRY="docker.io"
export CONTAINER_PREFIX="tsuru/k8s-dns"
make .docker.io_tsuru_k8s-dns-node-cache-amd64_${VERSION}-push
popd
