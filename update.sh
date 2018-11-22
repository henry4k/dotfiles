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
./install-plugins
#./update-plugins
popd

function Download()
{
    local file="$1"
    local url="$2"

    if [[ -e "$file" ]]; then
        echo "$file has already been downloaded"
    else
        curl --progress-bar "$url" -o "$file"
    fi
}

pushd vim/autoload
Download 'plug.vim' 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
popd

# Install vim plugins:
if which nvim >/dev/null; then
    nvim --headless +PlugInstall +qa
else
    vim -E -c PlugInstall -c qa >/dev/null
fi

mkdir -p vim/dictionaries
pushd vim/dictionaries
curl --progress-bar 'https://www.gutenberg.org/files/3202/files/mthesaur.txt' -o 'mthesaur.txt'
popd

pip3 install --user --upgrade pep8
pip3 install --user --upgrade pylint
pip3 install --user --upgrade language-check
pip3 install --user --upgrade cmakelint
pip3 install --user --upgrade yamllint
