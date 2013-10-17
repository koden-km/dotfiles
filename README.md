# dotfiles

This is my personal dotfiles repository.

## Installation

```bash
cd ~
git clone git@github.com:koden-km/dotfiles.git
ln -s dotfiles/dotfiles/.bash_profile
# update configuration options in .bash_profile
source ~/.bash_profile
update-dotfiles

# install vim bundles
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

## Git Prompt

The current revision is colored to indicate whether or not it's safe to work on this branch according to the rules of git-flow.

 * green: personal branch
 * white: develop branch
 * orange: master branch or tag
 * grey: empty / no commits
 * red: any other commit

When HEAD is detached, the current revision is shown surrounded in angle brackets.
