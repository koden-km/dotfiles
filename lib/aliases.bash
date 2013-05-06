alias ls="ls -G"
alias ll="ls -al"
alias grep="grep --color=auto"

if [[ $(uname) == "Darwin" ]]; then
    alias mac-clean-dsstore="find . -name '.DS_Store' -delete"
    # fixing 'open with' duplicates may also need to: killall Finder
    alias mac-fix-openwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
