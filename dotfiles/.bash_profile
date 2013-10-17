# Path for "rclone" to clone into ...
GIT_DIR_GITHUB="$HOME/Documents/GitHub"

# Path for "rclone-cwx" to clone into ...
GIT_DIR_CWX="$HOME/WebDev"

# Directories to search when using "rcd" ...
# This probably wont work if any of the directory names contain spaces.
GIT_DIR_LIST="$GIT_DIR_GITHUB $GIT_DIR_CWX"

# A space separated list of usernames considered to be "me" ...
DEFAULT_USERNAMES="kevin kmillar"

export DOTFILES_REPO="$HOME/dotfiles"

export PATH="~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/pear/bin:$PATH"

# Go lang
# i think GOROOT of "/usr/local/go" is optional because that is the default.
export GOROOT=/opt/local/go
# Colon seperated list of a workspaces.
export GOPATH=$HOME/Development/Go

# Source the library files ...
for filename in $DOTFILES_REPO/lib/*.bash; do
    source $filename
done

unset filename

# Source bashrc file if it exists ...
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
