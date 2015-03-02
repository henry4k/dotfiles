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
GitCloneOrPull 'zgen' 'https://github.com/tarjoilija/zgen.git'
popd
zsh/install-plugins
zsh/update-plugins

pushd vim/bundle
GitCloneOrPull 'vundle' 'https://github.com/gmarik/vundle.git'
popd

pushd bin
GitCloneOrPull 't' 'https://github.com/sjl/t.git'
popd
mkdir -p "$HOME/.tasks"


function DownloadAndExtractZip()
{
    local dir="$1"
    local url="$2"

    if [[ -e "$dir" ]]; then
        echo "$dir has already been downloaded"
    else
        mkdir -p "$dir"
        local tmp="${RANDOM}.zip"
        curl --progress-bar "$url" -o "$tmp"
        unzip -d "$dir" "$tmp"
        rm "$tmp"
    fi
}

function DownloadAndExtractZipFile()
{
    local file="$1"
    local url="$2"

    if [[ -e "$file" ]]; then
        echo "$file has already been downloaded"
    else
        local tmp="${RANDOM}.zip"
        curl --progress-bar "$url" -o "$tmp"
        unzip "$tmp" "$file"
        rm "$tmp"
    fi
}

mkdir -p vim/dictionaries
pushd vim/dictionaries
DownloadAndExtractZipFile 'mthesaur.txt' 'http://www.gutenberg.org/dirs/etext02/mthes10.zip'
popd

pip3 install --user --upgrade pep8
pip3 install --user --upgrade pylint
pip3 install --user --upgrade language-check
