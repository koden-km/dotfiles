# dotfiles

This is my personal dotfiles repository.

## Install

    cd ~
    git clone git@github.com:koden-km/dotfiles.git
    cp dotfiles/dotfiles/.bash_profile ~
    source ~/.bash_profile
    update-dotfiles

## Git Prompt

The current revision is colored to indicate whether or not it's safe to work on this branch according to the rules of git-flow.

 * green: personal branch
 * white: develop branch
 * orange: master branch or tag
 * grey: empty / no commits
 * red: any other commit

When HEAD is detached, the current revision is shown surrounded in angle brackets.
