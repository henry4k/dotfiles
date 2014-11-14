# vim: set filetype=zsh foldmethod=marker:
script="$_"
zshDir=$(dirname $script)


# Bundles {{{1
source "$zshDir/antigen/antigen.zsh"
## run 'antigen update' to update bundles
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle tarruda/zsh-autosuggestions
antigen bundle sharat87/zsh-vim-mode


# Common {{{1
source "$zshDir/../profile.sh" # Since ZSH doesn't sources ~/.profile
fpath=("$zshDir/functions" $fpath)

alias tmux='tmux -2'
alias mv='mv --no-clobber'
alias info='info --vi-keys'
alias gdb='gdb --quiet'
alias t="$zshDir/../bin/t/t.py --task-dir ~/.tasks --list tasks"

if which 'xdg-open' > /dev/null; then
    alias open='xdg-open'
fi


# Colors {{{1
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
lsFlags="-bF"
alias ls="ls $lsFlags $lsColor"
alias  l="ls $lsFlags -1 $lsColor"
alias ll="ls $lsFlags -lh $lsColor"

alias grep='grep --color=auto'



# Keymap {{{1
bindkey '^f' vi-forward-word
#bindkey '^f' vi-forward-blank-word

bindkey "^W" backward-kill-word    # vi-backward-kill-word
bindkey "^H" backward-delete-char  # vi-backward-delete-char
bindkey "^U" kill-line             # vi-kill-line
bindkey "^?" backward-delete-char  # vi-backward-delete-char

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


# Misc {{{1
setopt nobeep
setopt extended_glob
setopt interactive_comments

autoload colors && colors


# History {{{1
export HISTSIZE=3000
export SAVEHIST=2500
export HISTFILE="$HOME/.zsh_history"

setopt hist_fcntl_lock
setopt inc_append_history
setopt hist_no_functions
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

alias shist fc -RI # sync history

# Autocomplete {{{1
autoload -U compinit && compinit

setopt automenu
setopt list_ambiguous
setopt hash_list_all
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

if autoload promptinit && promptinit 2>/dev/null; then
    source "$zshDir/prompt.zsh"
fi


# Finalization {{{1
antigen apply
