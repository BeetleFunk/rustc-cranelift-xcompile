#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

pushd app
cargo clean
popd

podman build -t xcompile -f aarch64.Dockerfile
