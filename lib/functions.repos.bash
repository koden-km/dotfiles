GIT_DIR_BASE="$HOME/Documents"
GIT_DIR_GITHUB="${GIT_DIR_BASE}/GitHub"

function git-directories {
    echo $GIT_DIR_GITHUB
}

# Clone a repo from GitHub into the appropriate directory.
function rclone {
    local repo=$1
    local dir="${GIT_DIR_GITHUB}/${repo}"

    mkdir -p "$(dirname $dir)"
    hub clone -p $repo $dir
    rcd $repo
}

# Open coverage reports in a browser ...
function rcov {
    open artifacts/tests/coverage/index.html
}

# Change directory into a git clone ...
function rcd {
    local name=$1

    if [ -z $name ]; then
        return
    fi

    local base=
    local matches=
    local count=

    if [ -d "${GIT_DIR_BASE}/${name}" ]; then
        matches="${GIT_DIR_BASE}/${name}"
        count=1
    fi

    if [[ $count == "" ]]; then
        for base in $(git-directories); do
            if [ -d "${base}/${name}" ]; then
                matches="${base}/${name}"
                count=1
                break
            fi
        done
    fi

    if [[ $count == "" ]]; then
        for base in $(git-directories); do
            matches=$(find $base -iname $name -mindepth 2 -maxdepth 2)
            count=$(echo $matches | wc -w | tr -d ' ')

            if [ $count -gt 0 ]; then
                break
            fi
        done
    fi

    if [ $count -eq 1 ]; then
        cd $matches
        repo=$(git-repo)
        if [ ! -z $repo ]; then
            echo "  $(color-green)>>> $(color-magenta)$repo $(color-dark-grey)found in $(color-blue)$(pwd)"
        fi
    elif [ $count -eq 0 ]; then
        echo "  $(color-red)!!! $(color-dark-grey)Repository $(color-grey)${name} $(color-dark-grey)does not exist."
    else
        echo "  $(color-yellow)??? $(color-dark-grey)Found $(color-grey)${count} $(color-dark-grey)repositories matching $(color-grey)${name}$(color-dark-grey):"
        for repo in $matches; do
            echo "    $(color-yellow)- $(color-magenta)$(echo $repo | cut -c$(expr 2 + ${#base})-)"
        done
    fi

    color-reset
}
