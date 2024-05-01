FROM docker.io/rust:latest
ARG CHANNEL

RUN apt update && apt upgrade -y
RUN apt install -y g++-aarch64-linux-gnu libc6-dev-arm64-cross

RUN rustup toolchain install "${CHANNEL}-x86_64-unknown-linux-gnu"
RUN rustup default "${CHANNEL}-x86_64-unknown-linux-gnu"
RUN rustup target add aarch64-unknown-linux-gnu

WORKDIR /app
COPY app ./

# Use the Rust Cranelift compiler that was built locally and copy the prebuilt aarch64 rustlib into that sysroot
COPY rustc_codegen_cranelift/dist ./cranelift_compiler/
RUN mkdir -p ./cranelift_compiler/lib/rustlib/
RUN cp -r "/usr/local/rustup/toolchains/${CHANNEL}-x86_64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu" ./cranelift_compiler/lib/rustlib/

CMD ["./build-and-copy-out.sh"]
