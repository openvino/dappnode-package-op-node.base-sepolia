FROM ubuntu:22.04

ENV OP_NODE_VERSION=v1.7.1

RUN apt-get update && apt-get install -y curl unzip jq git build-essential

# Install Go (required to build op-node)
RUN curl -OL https://golang.org/dl/go1.22.2.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && \
    ln -s /usr/local/go/bin/* /usr/local/bin/

# Build OP Stack monorepo
RUN git clone https://github.com/ethereum-optimism/optimism.git /opt/optimism && \
    cd /opt/optimism/op-node && \
    git checkout ${OP_NODE_VERSION} && \
    make op-node && \
    mv ./bin/op-node /usr/local/bin/op-node

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

