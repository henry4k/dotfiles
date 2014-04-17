#!/bin/bash
set -e
cd $(dirname $0)

function GitCloneOrPull()
{
    local dir="$1"
    local url="$2"

    if [[ -e "$dir" ]]; then
        pushd "$dir"
        git pull
        popd
    else
        git clone "$url" "$dir"
    fi
}

pushd zsh
GitCloneOrPull 'antigen' 'https://github.com/zsh-users/antigen.git'
popd

pushd vim/bundle
GitCloneOrPull 'vundle' 'https://github.com/gmarik/vundle.git'
popd
