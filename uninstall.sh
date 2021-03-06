#!/bin/bash
set -e

cd "$(dirname $0)"
Dotfiles="$PWD"

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

UninstallDotfile "$HOME/.profile"
UninstallDotfile "$HOME/.zshrc"
UninstallDotfile "$HOME/.vimrc"
UninstallDotfile "$HOME/.config/nvim/init.vim"
UninstallDotfile "$HOME/.tmux.conf"
UninstallDotfile "$HOME/.gdbinit"

rm -f "$HOME/.tupoptions"
rm -f "$HOME/.proverc"
rm -f "$HOME/.rep.lua"
rm -f "$HOME/.sqliterc"
rm -f "$HOME/.gitconfig"
rm -f "$HOME/.dircolors"
rm -f "$HOME/.agignore"

echo 'Uninstalled dotfiles!'
