FROM docker.io/rust:latest

RUN apt update && apt upgrade -y
RUN apt install -y g++-aarch64-linux-gnu libc6-dev-arm64-cross

RUN rustup toolchain install nightly-2024-04-20-x86_64-unknown-linux-gnu
RUN rustup default nightly-2024-04-20-x86_64-unknown-linux-gnu
RUN rustup target add aarch64-unknown-linux-gnu

WORKDIR /app
COPY app ./

CMD ["./build-and-copy-out.sh"]
