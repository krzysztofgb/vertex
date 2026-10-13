#!/usr/bin/env bash
# Format the files. With --check, report the files that need formatting.
set -euo pipefail
. "$(dirname "$0")/llvm-env.sh"
if [ "${1:-}" = "--check" ]; then
  shift
  exec clang-format --dry-run --Werror "$@"
fi
exec clang-format -i "$@"
