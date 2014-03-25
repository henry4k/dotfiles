#!/bin/bash
set -e

Dotfiles="$PWD/$(dirname $0)"
Destination="$HOME"

"$Dotfiles/uninstall.sh"

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

GitConfig='git config --global'
$GitConfig user.email 'henrykielmann@gmail.com'
$GitConfig user.name 'Henry Kielmann'
#$GitConfig init.templatedir "$Dotfiles/git/template"
$GitConfig push.default 'current'
$GitConfig color.ui true
$GitConfig core.editor '/usr/bin/env vim'
$GitConfig core.autocrlf 'input'
$GitConfig diff.tool 'vimdiff'
$GitConfig difftool.prompt true
$GitConfig log.decorate full
$GitConfig merge.conflictstyle 'diff3'
$GitConfig merge.tool 'splice'
$GitConfig mergetool.prompt false
$GitConfig mergetool.splice.cmd "vim -f \"\$BASE \$LOCAL \$REMOTE \$MERGED -c 'SpliceInit'\""
$GitConfig mergetool.splice.trustexitcode true
$GitConfig mergetool.fugitive.cmd "vim -f -c 'Gdiff' \$MERGED"
$GitConfig alias.d 'difftool'
$GitConfig alias.ctags '!.git/hooks/ctags'
#$GitConfig alias.lg "log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
$GitConfig alias.lg "log --color --pretty=format:'%C(blue)%an %C(bold)%C(black)- %Creset%s %C(bold)%C(black)(%ar)'"
$GitConfig alias.up "!f() { git fetch \$@ && git lg --reverse HEAD@{1}..; }; f"

"$Dotfiles/dircolors.sh" > "$Destination/.dircolors"

PostInstallScript="$Destination/.dotfiles/post-install"
if [[ -x "$PostInstallScript" ]]; then
    echo "Executing $PostInstallScript .."
    "$PostInstallScript"
fi

echo 'Installed dotfiles!'
