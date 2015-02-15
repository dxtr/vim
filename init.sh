#!/bin/sh

# This should be run before the first time vim is run with this configuration.

git submodule init
git submodule update
ln -s vimrc $HOME/.vimrc

if [[ ! -d $HOME/.vim/bundle ]]; then
	mkdir -p $HOME/.vim/bundle
fi

if [[ ! -d $HOME/.vim/backup ]]; then
	mkdir -p $HOME/.vim/backup
fi

if [[ ! -d $HOME/.vim/swap ]]; then
	mkdir -p $HOME/.vim/swap
fi

vim -c BundleInstall
