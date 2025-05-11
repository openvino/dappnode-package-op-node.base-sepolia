FROM golang:1.22

# Install basic dependencies
RUN apt-get update && apt-get install -y build-essential git curl

# Clone the optimism monorepo and build op-node from a pinned commit
RUN git clone https://github.com/ethereum-optimism/optimism.git /opt/optimism && \
    cd /opt/optimism && \
    git fetch --all && \
    git checkout b43f79c71d3dd715d8a8ac0e22ebf989adbf753b && \
    cd op-node && \
    go build -o /usr/local/bin/op-node ./cmd/op-node


# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
