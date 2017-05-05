alias ls="ls -G"
alias ll="ls -al"
alias grep="grep --color=auto"
alias less="less -R"

# ctags
alias ctags-php='ctags -R --languages=PHP'
alias ctags-js='ctags -R --languages=JavaScript'
alias ctags-java='ctags -R --languages=Java'
alias ctags-go='ctags -R --languages=Go'
alias ctags-cpp='ctags -R --languages=C++'
alias ctags-csharp='ctags -R --languages=C#'
alias ctags-py='ctags -R --languages=Python'

# horrizonal line
alias hr='eval "echo; printf '=%.0s' {1..$COLUMNS}; echo; echo"'

#if [[ $(uname) == "Darwin" ]]; then
#    alias mac-clean-dsstore="find . -name '.DS_Store' -delete"
#    # fixing 'open with' duplicates may also need to: killall Finder
#    alias mac-fix-openwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
#fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
