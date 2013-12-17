export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less -isR'
export MANPAGER="$PAGER"
export GROFF_NO_SGR=1

if [[ "$TERM" != 'dumb' ]]; then
    export TERM='xterm-256color'
    export COLORTERM='yes'
    export CLICOLOR=1

    alias ls='ls -GbF'
    alias  l='ls -GbF'
    alias ll='ls -GblFh'
    alias grep='grep --color=auto'

    export LESS_TERMCAP_mb=$(printf '\e[1;31m')
    export LESS_TERMCAP_md=$(printf '\e[1;31m')
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_so=$(printf '\e[1;44;33m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_us=$(printf '\e[1;32m')

    #export LESS_TERMCAP_mb=$(printf '\e[1;31m')
    #export LESS_TERMCAP_md=$(printf '\e[1;38;5;74m')
    #export LESS_TERMCAP_me=$(printf '\e[0m')
    #export LESS_TERMCAP_se=$(printf '\e[0m')
    #export LESS_TERMCAP_so=$(printf '\e[38;5;246m')
    #export LESS_TERMCAP_ue=$(printf '\e[0m')
    #export LESS_TERMCAP_us=$(printf '\e[4;38;5;146m')
fi
