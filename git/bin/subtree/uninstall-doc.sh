#!/bin/bash
cd "$(dirname $0)"
Prefix="$1"
if [[ -z "$Prefix" ]]; then
    echo "Usage: $0 <prefix>"
    exit 1
fi
rm -f "$Prefix/share/man/man1/git-subtree.1"
