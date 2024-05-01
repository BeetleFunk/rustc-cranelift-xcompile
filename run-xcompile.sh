#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

if [ -d "output" ]; then
  rm -rf previous-output
  mv output previous-output
fi
mkdir -p output

podman run -v ./output:/app/output rustc-cranelift-xcompile
