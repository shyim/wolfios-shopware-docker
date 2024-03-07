#!/usr/bin/env bash

set -e
set -x

version=$1

cd fpm
docker build -t ghcr.io/shyim/wolfios-shopware-docker:$version-fpm .

cd ../caddy
docker build -t ghcr.io/shyim/wolfios-shopware-docker:$version -t ghcr.io/shyim/wolfios-shopware-docker:$version-caddy --build-arg PHP_VERSION=$version .
