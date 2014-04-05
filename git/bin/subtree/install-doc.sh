#!/bin/bash
cd "$(dirname $0)"
Prefix="$1"
if [[ -z "$Prefix" ]]; then
    echo "Usage: $0 <prefix>"
    exit 1
fi
install -d -m 755 "$Prefix/share/man/man1"
install -m 644 './git-subtree.1' "$Prefix/share/man/man1"
