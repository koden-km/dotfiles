HISTCONTROL=ignoreboth

# Path for "rclone" to clone into ...
GIT_DIR_GITHUB="$HOME/GitHub"

# Path for "rclone-cwx" to clone into ...
GIT_DIR_CWX="$HOME/WebDev"

# Path for "rclone-go" to clone into ...
GIT_DIR_GITHUB_GO="$HOME/Development/Go/src/github.com"

# Directories to search when using "rcd" ...
# This probably wont work if any of the directory names contain spaces.
GIT_DIR_LIST="$GIT_DIR_GITHUB $GIT_DIR_CWX $GIT_DIR_GITHUB_GO"

# A space separated list of usernames considered to be "me" ...
DEFAULT_USERNAMES="kevin kmillar"

export DOTFILES_REPO="$HOME/dotfiles"

export PATH="$HOME/bin:$PATH"

# Go lang
# Colon seperated list of a workspaces.
export GOPATH=$HOME/Development/Go

# Source the library files ...
for filename in $DOTFILES_REPO/lib/*.bash; do
    source $filename
done

unset filename

ulimit -n 8192

# Source bashrc file if it exists ...
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

alias hr='eval "echo; printf '=%.0s' {1..$COLUMNS}; echo; echo"'
