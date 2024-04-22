#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc \
CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc \
CXX_aarch64_unknown_linux_gnu=aarch64-linux-gnu-g++ \
RUSTFLAGS="--emit llvm-ir --emit asm" \
cargo build -v -v --target aarch64-unknown-linux-gnu

mkdir -p output
cp -a target/. output/
