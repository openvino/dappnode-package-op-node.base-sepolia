# DAppNode Package: op-node for Base Sepolia

This package runs the `op-node` for syncing the Base Sepolia L2 rollup chain.

## Environment Variables

- `OP_NODE_L1_RPC`: L1 Ethereum endpoint (e.g. Infura, Alchemy)
- `OP_NODE_L2_RPC`: L2 execution endpoint (your Base Sepolia Geth)
- `OP_NODE_ROLLUP_CONFIG`: Path to the rollup config (e.g., /data/rollup.json)

## Ports

- `9545`: JSON-RPC
- `9003`: Metrics

