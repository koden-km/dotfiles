#!/bin/bash

# Home
cd ~

# Setup Bash
rm -f .bash_profile
ln -s dotfiles/.bash_profile .bash_profile

# Setup Git
rm -f .gitconfig
rm -f .gitignore
rm -f .gitignore_global
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.gitignore.global .gitignore.global

# Setup Screen
rm -f .screenrc
ln -s dotfiles/.screenrc .screenrc

# Setup Vim
rm -f .vimrc
rm -f .gvimrc
if [ -d .vim ]; then
    rm -rf .vim
else
    rm -f .vim
fi
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.vim .vim
