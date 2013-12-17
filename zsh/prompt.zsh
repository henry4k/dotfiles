
#### Prompt

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
    autoload -U colors && colors
    add-zsh-hook precmd prompt_custom_precmd
    zle -N zle-keymap-select
    zle -N zle-line-init
}

function prompt_custom_precmd ()
{
    local reset="$reset_color"
    local userColor="$reset%F{blue}"
    local shadedColor="$reset%B%F{black}"
    local hostColor="$shadedColor"
    local dirColor="$reset%F{white}"


    if [[ "$ZKEYMAP" == 'vicmd' ]]; then
        local end="$reset%F{green}N>"
    else
        local end="$reset%F{cyan}I>"
    fi


    local topDir=$(basename $PWD)
    local parentDir=$(dirname $PWD)

    if [[ "$topDir" == '/' ]]; then
        local parentDir=''
    elif [ "$parentDir" != '/' ]; then
        local parentDir="$parentDir/"
    fi


    PROMPT="\
${userColor}%n\
${shadedColor}@\
${hostColor}%m \
${shadedColor}${parentDir}\
${dirColor}${topDir} \
${end} \
%{$reset_color%}"
}


#### Show input mode
export KEYTIMEOUT=1
ZKEYMAP='main'

function zle-keymap-select
{
    ZKEYMAP="$KEYMAP"
    prompt_custom_precmd
    zle reset-prompt
}

function zle-line-init
{
    zle -K main
    ZKEYMAP="$KEYMAP"
    prompt_custom_precmd
    zle reset-prompt
}


prompt_themes+=( custom )
prompt custom
