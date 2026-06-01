#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <testnet_wallet_address> [threads] [rpc_port]"
  exit 1
fi

ADDRESS="$1"
THREADS="${2:-2}"
RPC_PORT="${3:-38181}"

curl -fsS -X POST "http://127.0.0.1:${RPC_PORT}/start_mining" \
  -H 'Content-Type: application/json' \
  -d "{\"miner_address\":\"${ADDRESS}\",\"threads_count\":${THREADS},\"do_background_mining\":false,\"ignore_battery\":true}"

echo
echo "Mining request submitted to RPC port ${RPC_PORT}."
