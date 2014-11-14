# vim: set foldmethod=marker:


# Misc {{{1
export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less -isR'
export MANPAGER="$PAGER"
export GROFF_NO_SGR=1


# Locale {{{1
export LANG="en_US.UTF-8"
export LANGUAGE="$LANG"
export LC_CTYPE="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"
export LC_COLLATE="$LANG"
export LC_MONETARY="$LANG"
export LC_MESSAGES="$LANG"
export LC_PAPER="$LANG"
export LC_NAME="$LANG"
export LC_ADDRESS="$LANG"
export LC_TELEPHONE="$LANG"
export LC_MEASUREMENT="$LANG"
export LC_IDENTIFICATION="$LANG"
export LC_ALL="$LANG"


# Colors {{{1
export LESS_TERMCAP_mb=$(printf '\e[1;31m')
export LESS_TERMCAP_md=$(printf '\e[1;31m')
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_so=$(printf '\e[1;44;33m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')


# SSH Agent {{{1
echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent`
fi
