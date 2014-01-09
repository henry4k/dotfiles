#!/bin/sh

set -e

$(dirname $0)/uninstall.sh

Dotfiles="$PWD/$(dirname $0)"
Destination="$HOME"

cat >> "$Destination/.zshrc" << EOF
# DOTFILES BEGIN
source '$Dotfiles/zsh/main.zsh'
# DOTFILES END
EOF

cat >> "$Destination/.vimrc" << EOF
" DOTFILES BEGIN
source $Dotfiles/vim/main.vim
" DOTFILES END
EOF

cat >> "$Destination/.tmux.conf" << EOF
# DOTFILES BEGIN
source-file "$Dotfiles/tmux.conf"
# DOTFILES END
EOF

cat >> "$Destination/.gdbinit" << EOF
# DOTFILES BEGIN
source $Dotfiles/gdbinit
# DOTFILES END
EOF

cp "$Dotfiles/gitconfig" "$Destination/.gitconfig"

PostInstallScript="$Destination/.dotfiles/post-install"
if [[ -x "$PostInstallScript" ]]; then
    echo "Executing $PostInstallScript .."
    $PostInstallScript
fi

echo 'Installed dotfiles!'
