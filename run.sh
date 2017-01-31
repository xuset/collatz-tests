#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for f in $(find "$DIR" -type f -name "*.in"); do
  prefix=$(echo $f | cut -f 1 -d \.)
  python3 "$DIR/../RunCollatz.py" < "$prefix.in" > "$prefix.tmp"
  if diff --strip-trailing-cr "$prefix.out" "$prefix.tmp" > "$prefix.diff"; then
    echo "Passed ${prefix:${#DIR} + 1}"
  else
    echo "FAILED ${prefix:${#DIR} + 1}"
  fi
done
