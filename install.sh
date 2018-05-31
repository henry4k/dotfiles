#!/bin/bash
set -e

cd "$(dirname $0)"
Dotfiles="$PWD"

HOME="$HOME"

"$Dotfiles/uninstall.sh"

cat >> "$HOME/.profile" << EOF
# DOTFILES BEGIN
source '$Dotfiles/profile.sh'
# DOTFILES END
EOF

cat >> "$HOME/.zshrc" << EOF
# DOTFILES BEGIN
source '$Dotfiles/zsh/main.zsh'
# DOTFILES END
EOF

cat >> "$HOME/.vimrc" << EOF
" DOTFILES BEGIN
source $Dotfiles/vim/init.vim
" DOTFILES END
EOF

mkdir -p "$HOME/.config/nvim"
cat >> "$HOME/.config/nvim/init.vim" << EOF
" DOTFILES BEGIN
source $Dotfiles/vim/init.vim
" DOTFILES END
EOF

cat >> "$HOME/.tmux.conf" << EOF
# DOTFILES BEGIN
source-file "$Dotfiles/tmux.conf"
# DOTFILES END
EOF

cat >> "$HOME/.gdbinit" << EOF
# DOTFILES BEGIN
source $Dotfiles/gdbinit
# DOTFILES END
EOF

ln -s "$Dotfiles/proverc" "$HOME/.proverc"
ln -s "$Dotfiles/tupoptions" "$HOME/.tupoptions"
ln -s "$Dotfiles/rep.lua" "$HOME/.rep.lua"
ln -s "$Dotfiles/sqliterc" "$HOME/.sqliterc"
ln -s "$Dotfiles/agignore" "$HOME/.agignore"

GitConfig='git config --global'
$GitConfig user.email 'henrykielmann@gmail.com'
$GitConfig user.name 'Henry Kielmann'
$GitConfig credential.username 'henry4k'
$GitConfig credential.helper 'cache --timeout=3600'
#$GitConfig init.templatedir "$Dotfiles/git/template"
$GitConfig push.default 'current'
$GitConfig color.ui true
$GitConfig core.editor '/usr/bin/env nvim'
$GitConfig core.autocrlf 'input'
$GitConfig diff.tool 'vimdiff'
$GitConfig difftool.prompt false
$GitConfig log.decorate full
$GitConfig merge.conflictstyle 'diff3'
$GitConfig merge.tool 'fugitive'
$GitConfig mergetool.prompt false
$GitConfig mergetool.splice.cmd "vim -f \"\$BASE \$LOCAL \$REMOTE \$MERGED -c 'SpliceInit'\""
$GitConfig mergetool.splice.trustexitcode true
$GitConfig mergetool.fugitive.cmd "vim -f -c 'Gdiff' \$MERGED"
$GitConfig alias.wdiff 'diff --word-diff=color'
$GitConfig alias.d 'difftool'
$GitConfig alias.s "!$Dotfiles/git/bin/s"
$GitConfig alias.ctags '!.git/hooks/ctags'
$GitConfig alias.lg "log --color --abbrev-commit --pretty=format:'%C(bold black)%h by %C(reset)%C(blue)%an %C(bold black)%ar: %C(reset)%s'"
$GitConfig alias.up "!$Dotfiles/git/bin/up"

"$Dotfiles/dircolors.sh" > "$HOME/.dircolors"

PostInstallScript="$HOME/.dotfiles/post-install"
if [[ -x "$PostInstallScript" ]]; then
    echo "Executing $PostInstallScript .."
    "$PostInstallScript"
fi

echo 'Installed dotfiles!'
