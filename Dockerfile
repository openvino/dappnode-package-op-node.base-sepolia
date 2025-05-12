# Stage 1: Build op-node binary
FROM golang:1.21 AS builder

RUN apt-get update && apt-get install -y make git

WORKDIR /src
RUN git clone https://github.com/ethereum-optimism/optimism.git
WORKDIR /src/optimism/op-node
RUN git checkout v1.2.0
RUN make op-node

# Stage 2: Create slim runtime image
FROM debian:bullseye-slim
COPY --from=builder /src/optimism/op-node/op-node /usr/local/bin/op-node
ENTRYPOINT ["op-node"]
