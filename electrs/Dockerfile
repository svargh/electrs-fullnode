# Based on docker-electrs
FROM rust:1-slim-bookworm AS builder

ARG BUILD_ELECTRS_VERSION

WORKDIR /build

RUN apt-get update
RUN apt-get install -y git clang cmake build-essential libsnappy-dev
RUN apt-get install -y librocksdb-dev

RUN git clone --branch $BUILD_ELECTRS_VERSION https://github.com/romanz/electrs .

# cargo under QEMU building for ARM can consumes 10s of GBs of RAM...
# Solution: https://users.rust-lang.org/t/cargo-uses-too-much-memory-being-run-in-qemu/76531/2
ENV CARGO_NET_GIT_FETCH_WITH_CLI true

RUN cargo build --release --bin electrs

FROM ubuntu:22.04
COPY --from=builder /build/target/release/electrs /bin/electrs

RUN groupadd -g 1011 user01
RUN useradd -rm -d /home/user01 -s /bin/bash -u 1011 user01 -g 1011
USER user01
WORKDIR /home/user01

STOPSIGNAL SIGINT
