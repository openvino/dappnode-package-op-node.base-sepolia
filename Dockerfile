FROM golang:1.22

# Install basic dependencies
RUN apt-get update && apt-get install -y build-essential git curl

# Clone the optimism monorepo and build op-node from a pinned commit
RUN git clone https://github.com/ethereum-optimism/optimism.git /opt/optimism && \
    cd /opt/optimism && \
    git checkout 3a19059759d5a99f6c325efc014a6ce1ef21e5b1 && \
    cd op-node && \
    go build -o /usr/local/bin/op-node ./cmd/op-node

# Add entrypoint script
COPY entrypoint

