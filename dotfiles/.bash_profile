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

export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/mariadb-10.0/bin:/usr/local/pear/bin:$PATH"

# Go lang
# i think GOROOT of "/usr/local/go" is optional because that is the default.
export GOROOT=/opt/local/lib/go
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

##
# Your previous /Users/kevin/.bash_profile file was backed up as /Users/kevin/.bash_profile.macports-saved_2015-11-23_at_11:31:19
##

# MacPorts Installer addition on 2015-11-23_at_11:31:19: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
