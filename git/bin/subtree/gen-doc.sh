#!/bin/sh
GitVersion=$(git --version | sed 's/git version //')
asciidoc -b docbook -d manpage -f './asciidoc.conf' "-agit_version=$GitVersion" './subtree.txt'
xmlto -m './manpage-normal.xsl' man './subtree.xml'
