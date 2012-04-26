#!/bin/sh

git submodule init
git submodule update
cd ..
mv vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
mkdir ~/.vim/backup
mkdir ~/.vim/swap
