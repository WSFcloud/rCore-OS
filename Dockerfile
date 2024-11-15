# syntax=docker/dockerfile:1

#Set Lab Environment
FROM debian:bookworm as build

WORKDIR /tmp

# Install general tools
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget curl jq git python3 build-essential strace \
    man psmisc file libreadline-dev \
    libglib2.0-0 libfdt1 libpixman-1-0 zlib1g \
    gdb-multiarch qemu-system

# Install Rust
# - https://www.rust-lang.org/tools/install
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static \
    RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --no-modify-path --profile minimal --default-toolchain nightly

# Build env for labs
# See os/Makefile `env:` for example.
# This avoids having to wait for these steps each time using a new container.
COPY rust-toolchain.toml rust-toolchain.toml
RUN rustup target add riscv64gc-unknown-none-elf && \
    cargo install toml-cli cargo-binutils && \
    RUST_VERSION=$(toml get -r rust-toolchain.toml toolchain.channel) && \
    Components=$(toml get -r rust-toolchain.toml toolchain.components | jq -r 'join(" ")') && \
    rustup install $RUST_VERSION && \
    rustup component add --toolchain $RUST_VERSION $Components

# Set GDB
RUN ln -s /usr/bin/gdb-multiarch /usr/bin/riscv64-unknown-elf-gdb

# Stage 3 Sanity checking
RUN qemu-system-riscv64 --version && \
    rustup --version && \
    cargo --version && \
    rustc --version && \
    riscv64-unknown-elf-gdb --version