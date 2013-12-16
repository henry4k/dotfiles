#!/bin/bash
set -e
cd $(dirname $0)

pushd vim/bundle
if [ -e vundle ]; then
    pushd vundle
    git pull
    popd
else
    git clone 'https://github.com/gmarik/vundle.git'
fi
vim +BundleInstall +qall
popd
