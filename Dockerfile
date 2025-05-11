FROM golang:1.22

# Install required tools
RUN apt-get update && apt-get install -y build-essential git curl make

ENV OP_NODE_VERSION=v1.6.2

# Clone optimism repo and build op-node
RUN git clone https://github.com/ethereum-optimism/optimism.git /opt/optimism && \
    cd /opt/optimism/op-node && \
    git checkout ${OP_NODE_VERSION} && \
    make op-node && \
    mv ./bin/op-node /usr/local/bin/op-node

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

