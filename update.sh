#!/bin/bash
set -e
cd $(dirname $0)

pushd zsh
if [ -e zsh-syntax-highlighting ]; then
    pushd zsh-syntax-highlighting
    git pull
    popd
else
    git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git'
fi
popd

pushd vim/bundle
if [ -e vundle ]; then
    pushd vundle
    git pull
    popd
else
    git clone 'https://github.com/gmarik/vundle.git'
fi
vim +BundleInstall +BundleClean! +qall
popd
