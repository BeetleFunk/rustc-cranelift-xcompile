#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc \
CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc \
CXX_aarch64_unknown_linux_gnu=aarch64-linux-gnu-g++ \
RUSTFLAGS="--emit llvm-ir" \
./cranelift_compiler/cargo-clif build -v -v --target aarch64-unknown-linux-gnu

# When running in a container with mounted output volume, automatically copy build artifacts to that directory
if [ -d "output" ]; then
  cp -a target/. output/
fi
