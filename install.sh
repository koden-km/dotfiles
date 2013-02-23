#!/bin/bash

# Home
cd ~

# Setup Git
rm -f .gitconfig
rm -f .gitignore
ln -s dotfiles/.gitconfig .gitconfig
ln -s dotfiles/.gitignore .gitignore

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

