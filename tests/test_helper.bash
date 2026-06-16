#!/usr/bin/env bash
# Test helper: sources functions from OracleShellInstall.sh without executing main()
# and without requiring root or Oracle environment.

# Load bats libraries
load 'bats-support/load'
load 'bats-assert/load'

# Path to the script under test
SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_DIRNAME}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/OracleShellInstall.sh"

# Create a temp directory for test artifacts
setup_test_env() {
  TEST_TMPDIR="$(mktemp -d)"
  export TEST_TMPDIR
}

teardown_test_env() {
  if [[ -d "${TEST_TMPDIR:-}" ]]; then
    rm -rf "$TEST_TMPDIR"
  fi
}

# Source only the functions from the script without running main or
# system-dependent initialization.
# We create a modified copy that skips the problematic global lines.
source_functions() {
  local tmp_script
  tmp_script="$(mktemp)"

  # Create a modified version of the script:
  # 1. Replace /proc/meminfo reads with safe defaults
  # 2. Remove the find command that deletes log files
  # 3. Remove the 'main "$@"' call at the end
  # 4. Remove the bash version check that calls exit
  sed \
    -e 's|os_memory_total=.*(/proc/meminfo)|os_memory_total=8388608|' \
    -e 's|swap_total=.*(/proc/meminfo)|swap_total=4194304|' \
    -e 's|^find "\$software_dir".*||' \
    -e 's|^main "\$@"||' \
    -e '/^bash_version=/,/^fi$/{ s/exit 1/: # skip exit/; }' \
    "$SCRIPT_PATH" > "$tmp_script"

  # Pre-set global variables to avoid /proc dependency
  export os_memory_total=8388608
  export swap_total=4194304
  export swap_count=0
  export software_dir="$TEST_TMPDIR"
  export oracleinstalllog="$TEST_TMPDIR/test_install.log"
  export current="20250101120000"

  # Source the modified script
  # shellcheck disable=SC1090
  source "$tmp_script"

  rm -f "$tmp_script"
}
