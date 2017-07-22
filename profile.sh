# vim: set foldmethod=marker:


# Misc {{{1
if which nvim >/dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
export VISUAL="$EDITOR"
export PAGER='less -isR'
export MANPAGER="$PAGER"
export GROFF_NO_SGR=1


# Locale {{{1
#export LANG="en_US.UTF-8"
#export LANGUAGE="$LANG"
#export LC_CTYPE="$LANG"
#export LC_NUMERIC="$LANG"
#export LC_TIME="$LANG"
#export LC_COLLATE="$LANG"
#export LC_MONETARY="$LANG"
#export LC_MESSAGES="$LANG"
#export LC_PAPER="$LANG"
#export LC_NAME="$LANG"
#export LC_ADDRESS="$LANG"
#export LC_TELEPHONE="$LANG"
#export LC_MEASUREMENT="$LANG"
#export LC_IDENTIFICATION="$LANG"
#export LC_ALL="$LANG"


# Colors {{{1
#export TERM='xterm-256color'
#export COLORTERM='yes'
#export CLICOLOR=1

export LESS_TERMCAP_mb=$(printf '\e[1;31m')
export LESS_TERMCAP_md=$(printf '\e[1;31m')
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_so=$(printf '\e[1;44;33m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
