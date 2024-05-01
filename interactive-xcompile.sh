#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

echo "*** No output volume when running in interactive mode! ***"

podman run -it rustc-cranelift-xcompile bash
# podman run -v ./input:/app/input -it rustc-cranelift-xcompile bash
