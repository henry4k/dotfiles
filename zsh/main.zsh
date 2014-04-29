# vim: set filetype=zsh foldmethod=marker:
script="$_"
zshDir=$(dirname $script)

# Bundles {{{1
source "$zshDir/antigen/antigen.zsh"
## run 'antigen update' to update bundles
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-completions src
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle tarruda/zsh-autosuggestions
antigen bundle sharat87/zsh-vim-mode
antigen apply




# Common {{{1
source "$zshDir/../locale.sh"

export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less -isR'
export MANPAGER="$PAGER"
export GROFF_NO_SGR=1

alias tmux='tmux -2'

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
    alias  l="ls -bF1 $lsColor"
    alias ll="ls -blFh $lsColor"

    alias grep='grep --color=auto'

    export LESS_TERMCAP_mb=$(printf '\e[1;31m')
    export LESS_TERMCAP_md=$(printf '\e[1;31m')
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_so=$(printf '\e[1;44;33m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_us=$(printf '\e[1;32m')
fi


# Keymap {{{1
bindkey '^f' vi-forward-word
#bindkey '^f' vi-forward-blank-word


# Misc {{{1
setopt extended_glob
setopt autocd
setopt autopushd
setopt pushd_ignore_dups
setopt interactive_comments

autoload colors && colors


# Autocomplete {{{1
autoload -U compinit && compinit

setopt automenu
setopt hash_list_all
setopt correct
setopt complete_in_word
setopt always_to_end
setopt mark_dirs

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache on
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $zshDir/cache/ # TODO
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#function zle-line-init
#{
#    zle autosuggest-start
#}
#zle -N zle-line-init

if autoload promptinit && promptinit 2>/dev/null; then
    source "$zshDir/prompt.zsh"
fi
