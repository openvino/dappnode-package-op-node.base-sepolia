#!/bin/sh
exec op-node \
  --l1="${OP_NODE_L1_RPC}" \
  --l2="${OP_NODE_L2_RPC}" \
  --l1.beacon="${OP_NODE_L1_BEACON}" \
  --l2.jwt-secret="${OP_NODE_L2_ENGINE_AUTH}" \
  --rollup.config="${OP_NODE_ROLLUP_CONFIG}" \
  --rpc.addr=0.0.0.0 \
  --rpc.port=9545 \
  --metrics.enabled \
  --metrics.addr=0.0.0.0 \
  --metrics.port=9003 \
  --p2p.disable
