#!/bin/bash

# Home
cd ~

# Setup Vim
rm .vimrc
rm .gvimrc
rm -rf .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.vim .vim

