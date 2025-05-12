# Stage 1: Build op-node binary
FROM golang:1.22 AS builder

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        make \
        build-essential \
        pkg-config \
        libssl-dev \
        jq \
        protobuf-compiler \
        ca-certificates && \
    curl -sSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin

WORKDIR /src
RUN git clone --depth=1 --branch op-node/v1.13.2 https://github.com/ethereum-optimism/optimism.git
WORKDIR /src/optimism/op-node

# Checkout a working tag that matches source + go.mod requirement
RUN git checkout tags/op-node/v1.13.2

RUN just op-node

# Stage 2: Create slim runtime image
FROM debian:bullseye-slim
COPY --from=builder /src/optimism/op-node/bin/op-node /usr/local/bin/op-node
ENTRYPOINT ["op-node"]

