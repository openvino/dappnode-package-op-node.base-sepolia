FROM golang:1.22

RUN apt-get update && apt-get install -y build-essential git curl

# Clone and build op-node at pinned commit
RUN git clone https://github.com/ethereum-optimism/optimism.git /opt/optimism && \
    cd /opt/optimism && \
    git checkout c8a638191 && \
    cd op-node && \
    go build -o /usr/local/bin/op-node ./cmd/op-node

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

