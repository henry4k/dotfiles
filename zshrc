# vim: set filetype=zsh:

source "$(dirname $0)/zshrc-grml"

bindkey -v
setopt extendedglob
setopt extended_glob

#### Show input mode
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#
#    #PS1="${${KEYMAP/vicmd/[N]}/(main|viins)/[I]}"
#    #PS2=$PS1
#
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select


#### Prompt ####


function prompt_custom_help ()
{
    cat << 'EOF'
Help text. :D
EOF
}

function prompt_custom_setup ()
{
    #autoload -Uz vcs_info
    autoload -Uz add-zsh-hook
    #autoload -U colors && colors
    add-zsh-hook precmd prompt_custom_precmd
}

function prompt_custom_precmd ()
{
    #local userColor="%{$fg_no_bold['blue']%}"
    #local shadedColor="%{$fg_bold['black']%}"
    #local hostColor="%{$fg_no_bold['blue']%}"
    #local dirColor="%{$fg_no_bold['white']%}"

    local reset="$reset_color"
    local userColor="$reset%F{blue}"
    local shadedColor="$reset%B%F{black}"
    local hostColor="$shadedColor"
    local dirColor="$reset%F{white}"
    local endColor="$reset%F{green}"

    PROMPT="\
${userColor}%n\
${shadedColor}@\
${hostColor}%m \
${shadedColor}%-1d/\
${dirColor}%1d \
${endColor}> \
%{$reset_color%}"
}

prompt_themes+=( custom )

prompt custom
