#!/usr/bin/env bash
# Run all bats tests
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BATS="${SCRIPT_DIR}/bats-core/bin/bats"

if [[ ! -x "$BATS" ]]; then
  echo "ERROR: bats not found. Run 'git submodule update --init' first."
  exit 1
fi

echo "Running all tests..."
"$BATS" "${SCRIPT_DIR}"/test_*.bats
