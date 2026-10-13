#!/usr/bin/env bash
# Run clang-tidy on the files. Configure the debug preset first if the compile database is missing.
set -euo pipefail
. "$(dirname "$0")/llvm-env.sh"
db="${VERTEX_TIDY_BUILD:-build/debug}"
[ -f "$db/compile_commands.json" ] || cmake --preset debug >/dev/null
exec clang-tidy -p "$db" --quiet "$@"
