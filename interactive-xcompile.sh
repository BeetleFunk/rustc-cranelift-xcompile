#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

echo "*** No output volume when running in interactive mode! ***"
podman run -it xcompile bash
