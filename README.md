# DAppNode Package: Base Sepolia op-node

This repository builds and publishes a Docker image of the Optimism `op-node` client for the [Base Sepolia testnet](https://base.org/testnet).

The image is compiled **from source** using GitHub Actions and published to GitHub Container Registry (GHCR) under:

📦 **GHCR Image**: [`ghcr.io/openvino/op-node.base-sepolia:latest`](https://github.com/orgs/openvino/packages/container/package/op-node.base-sepolia)

> Replace `openvino` with your actual GitHub username/org if different.

---

## 🧱 Package Contents

- ✅ `Dockerfile`: Builds `op-node` from the [ethereum-optimism/optimism](https://github.com/ethereum-optimism/optimism) repo, tag `v1.3.0`
- ✅ `docker-compose.yml`: Defines how the node connects to Reth and Prysm
- ✅ `rollup.json`: Base Sepolia rollup configuration
- ✅ `.github/workflows/docker.yml`: CI workflow to build and push to GHCR
- ✅ `dappnode_package.json`: DAppNode package metadata

---

## 🛠 Build Details

This image is built using:

- 🔧 Base: `golang:1.21`
- 📦 Source: [ethereum-optimism/op-node @ v1.3.0](https://github.com/ethereum-optimism/optimism/releases/tag/v1.3.0)
- 🎯 Output binary: `op-node`
- 🐳 Final runtime: `debian:bullseye-slim`

---

## 🚀 Usage in DAppNode

To use this package in DAppNode:

```json
"image": "ghcr.io/openvino/op-node.base-sepolia:latest"

