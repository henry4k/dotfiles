#!/bin/sh

set -e

$(dirname $0)/uninstall.sh
$(dirname $0)/init.sh

Dotfiles="$PWD/$(dirname $0)"

cat >> "$HOME/.profile" << EOF
# DOTFILES BEGIN
source '$Dotfiles/profile'
# DOTFILES END
EOF

cat >> "$HOME/.zshrc" << EOF
# DOTFILES BEGIN
source '$Dotfiles/zshrc'
# DOTFILES END
EOF

cat >> "$HOME/.vimrc" << EOF
" DOTFILES BEGIN
source $Dotfiles/vimrc
" DOTFILES END
EOF

cat >> "$HOME/.tmux.conf" << EOF
# DOTFILES BEGIN
source-file "$Dotfiles/tmux.conf"
# DOTFILES END
EOF

echo 'Installed dotfiles!'
