# vim: set filetype=zsh foldmethod=marker:
script="$_"
zshDir=$(dirname $script)

# Common {{{1
export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less -isR'
export MANPAGER="$PAGER"
export GROFF_NO_SGR=1

alias tmux='tmux -2'

if which 'pinfo' > /dev/null; then
    function info()
    {
        local page="$1"
        local node="$2"
        pinfo "$page" "--node=$node"
    }
fi

# Colors {{{1
if [[ "$TERM" != 'dumb' ]]; then
    export TERM='xterm-256color'
    export COLORTERM='yes'
    export CLICOLOR=1

    if which 'dircolors' > /dev/null; then
        lsColor='--color=auto'
        if [[ -e "$HOME/.dircolors" ]]; then
            eval "$(dircolors "$HOME/.dircolors")"
        fi
    else
        lsColor='-G'
    fi
    alias ls="ls -bF $lsColor"
    alias  l="ls -bF $lsColor"
    alias ll="ls -blFh $lsColor"

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


# Keymap {{{1
bindkey -v
bindkey '^W' 'backward-kill-word'
bindkey '^H' 'backward-delete-char'
bindkey '^U' 'backward-kill-line'
bindkey '^?' 'backward-delete-char'


# Misc {{{1
setopt extendedglob
setopt extended_glob


# Prompt {{{1
if [[ "$TERM" != 'dumb' ]]; then
    zstyle ':completion:*' menu select=5
    zstyle ':completion:*:manuals'    separate-sections true
    zstyle ':completion:*:manuals.*'  insert-sections   true
    zstyle ':completion:*:man:*'      menu yes select
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                               /usr/local/bin  \
                                               /usr/sbin       \
                                               /usr/bin        \
                                               /sbin           \
                                               /bin            \
                                               /usr/X11R6/bin
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    source "$zshDir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    if autoload promptinit && promptinit 2>/dev/null; then
        source "$zshDir/prompt.zsh"
    fi
fi
