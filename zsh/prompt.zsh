
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
    autoload -U regexp-replace
    add-zsh-hook precmd prompt_custom_precmd
    zle -N zle-keymap-select
}

function prompt_custom_precmd ()
{
    if [[ "$ZKEYMAP" == 'vicmd' ]]; then
        local end="%F{green}N>"
    else
        local end="%F{cyan}I>"
    fi
    #local end="%F{green}>"

    local topDir="$(basename $PWD)"
    local parentDir="$(dirname $PWD)"

    if [[ "$topDir" == '/' ]]; then
        local parentDir=''
    elif [ "$parentDir" != '/' ]; then
        # Truncuate parentDir to 2 directories.
        local tmp="$(echo -n "$parentDir" | sed 's_^.*\(\(/[^/]*\)\{2\}\)$_\1_')"
        if [[ "$tmp" != "$parentDir" ]]; then
            local tmp="$(echo -n "$tmp" | sed 's_^/__')"
        fi
        local parentDir="$tmp/"
    fi

    PROMPT="\
%F{blue}%n\
%B%F{black}@%m $parentDir%b\
%F{white}$topDir \
$end %f"

    RPS1=''
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
