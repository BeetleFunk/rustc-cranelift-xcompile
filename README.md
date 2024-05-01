# Cross Compiling Rust with the Cranelift Backend
Cross-compile Rust for aarch64 using a locally built copy of the [rustc_codegen_cranelift](https://github.com/rust-lang/rustc_codegen_cranelift) project. This simple example builds a Docker/Podman image with the proper toolchain, linker, and target rustlib and provides a way to run cross-compilation using a custom build of the Rust Cranelift compiler.

## Requirements
- [Install a Rust Compiler](https://www.rust-lang.org/tools/install)
- [Install Podman](https://podman.io/docs/installation)

## Usage
Run `./build-container.sh` to build a `rustc-cranelift-xcompile` image. This script will automatically clone and build [rustc_codegen_cranelift](https://github.com/rust-lang/rustc_codegen_cranelift) if necessary. The contents of the `app` directory will be copied into the image as the code to be cross-compiled.

Run `./run-xcompile.sh` to cross-compile the app. This creates and runs a new container using the latest `rustc-cranelift-xcompile` image. Build artifacts from compilation will be copied to the `output` directory on the host via a bind-mounted volume.
