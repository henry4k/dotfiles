#!/bin/bash

set -e

RandomPrefix=$(basename $0)

function UninstallDotfile()
{
    local file="$1"

    if [ ! -e $file ]; then
        return
    fi

    local tempFile="/tmp/$RandomPrefix-$RANDOM"
    awk -f - $file > $tempFile << "EOF"
/.*DOTFILES BEGIN.*/, /.*DOTFILES END.*/ { next }
{ print $0 }
EOF

    mv -f $tempFile $file

    echo "Uninstalled dotfiles from $file"
}

UninstallDotfile "$HOME/.zshrc"
UninstallDotfile "$HOME/.vimrc"
UninstallDotfile "$HOME/.tmux.conf"
UninstallDotfile "$HOME/.gdbinit"

echo 'Uninstalled dotfiles!'
