# Stage 1: Build op-node binary
FROM golang:1.21 AS builder


# Install dependencies including just
RUN apt-get update && \
    apt-get install -y make git curl && \
    curl -sSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin

WORKDIR /src
RUN git clone https://github.com/ethereum-optimism/optimism.git
WORKDIR /src/optimism/op-node
RUN git checkout tags/op-node/v1.13.2
RUN make op-node

# Stage 2: Create slim runtime image
FROM debian:bullseye-slim
COPY --from=builder /src/optimism/op-node/op-node /usr/local/bin/op-node
ENTRYPOINT ["op-node"]
