#!/bin/sh

set -e

$(dirname $0)/uninstall.sh

Dotfiles="$PWD/$(dirname $0)"

cat >> "$HOME/.profile" << EOF
# DOTFILES BEGIN
source '$Dotfiles/profile.sh'
# DOTFILES END
EOF

cat >> "$HOME/.zprofile" << EOF
# DOTFILES BEGIN
emulate sh
source \$HOME/.profile
emulate zsh
# DOTFILES END
EOF

cat >> "$HOME/.zshrc" << EOF
# DOTFILES BEGIN
source '$Dotfiles/zsh/main.zsh'
# DOTFILES END
EOF

cat >> "$HOME/.vimrc" << EOF
" DOTFILES BEGIN
source $Dotfiles/vim/main.vim
" DOTFILES END
EOF

cat >> "$HOME/.tmux.conf" << EOF
# DOTFILES BEGIN
source-file "$Dotfiles/tmux.conf"
# DOTFILES END
EOF

echo 'Installed dotfiles!'
