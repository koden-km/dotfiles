# A space separated list of usernames considered to be "me", that are not shown in the prompt ...
export PROMPT_USERNAMES="kevin kmillar"
export DOTFILES_REPO="$HOME/dotfiles"
export HISTCONTROL="ignoreboth"
export PATH="$HOME/bin:$PATH"
export EDITOR="vim"
export VISUAL="$EDITOR"

type -t git > /dev/null && export HAS_GIT=true
type -t hub > /dev/null && export HAS_HUB=true
type -t grit > /dev/null && export HAS_GRIT=true

if BREW_PREFIX=$(brew --prefix 2> /dev/null); then
    export HAS_BREW=true
    export BREW_PREFIX="$BREW_PREFIX"
fi

# Source the library files ...
for DOTFILES_FILE in $DOTFILES_REPO/lib/*.bash; do
    source $DOTFILES_FILE
done
unset DOTFILES_FILE

if [ -e "$BREW_PREFIX/etc/bash_completion" ]; then
    source "$BREW_PREFIX/etc/bash_completion"
fi

[ $HAS_GRIT ] && eval "$(grit shell-integration)"

ulimit -n 8192

# Source bashrc file if it exists ...
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
