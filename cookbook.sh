#!/bin/sh
find src res -regextype posix-extended -regex '.+\.(cpp|h|nut)' | xargs -n 2 -- sed -ir 's/\t/    /g'
