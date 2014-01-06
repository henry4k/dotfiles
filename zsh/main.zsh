zshDir=$(dirname $0)

#source "$zshDir/grml.zsh"


bindkey -e
#bindkey -v
#bindkey '^W' 'backward-kill-word'
#bindkey '^H' 'backward-delete-char'
#bindkey '^U' 'backward-kill-line'
#bindkey '^?' 'backward-delete-char'


setopt extendedglob
setopt extended_glob


if [[ "$TERM" != 'dumb' ]]; then
#    zstyle ':completion:*' menu select=5
#    zstyle ':completion:*:manuals'    separate-sections true
#    zstyle ':completion:*:manuals.*'  insert-sections   true
#    zstyle ':completion:*:man:*'      menu yes select
#    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
#                                               /usr/local/bin  \
#                                               /usr/sbin       \
#                                               /usr/bin        \
#                                               /sbin           \
#                                               /bin            \
#                                               /usr/X11R6/bin

    source "$zshDir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    if autoload promptinit && promptinit 2>/dev/null; then
        source "$zshDir/prompt.zsh"
    fi
fi
