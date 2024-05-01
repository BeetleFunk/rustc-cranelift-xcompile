#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

pushd app
cargo clean
popd

# Clone and build the Rust Cranelift compiler if necessary
if [ ! -d "rustc_codegen_cranelift/dist" ]; then
  if [ ! -d "rustc_codegen_cranelift" ]; then
    git clone --quiet --filter=tree:0 https://github.com/rust-lang/rustc_codegen_cranelift.git
  fi
  pushd rustc_codegen_cranelift
  ./y.sh prepare
  # Cross-compilation target sysroot libraries are setup later in the Docker image build process
  ./y.sh build --sysroot none
  popd
fi

# The Rust toolchain used for the Docker image must match the version used to build rustc_codegen_cranelift
CHANNEL=$(awk -F'channel ?= ?' '{printf $2}' rustc_codegen_cranelift/rust-toolchain | tr -d '" \n')
podman build -t rustc-cranelift-xcompile -f aarch64.Dockerfile --build-arg CHANNEL="$CHANNEL"
