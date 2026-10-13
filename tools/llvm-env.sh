# Homebrew llvm is keg-only. Put it first in PATH to get new clang-format and clang-tidy.
for d in /opt/homebrew/opt/llvm/bin /usr/lib/llvm-21/bin /usr/lib/llvm-18/bin; do
  [ -d "$d" ] && PATH="$d:$PATH" && break
done
export PATH
