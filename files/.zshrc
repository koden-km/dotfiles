# Initialize zsh auto-completion, and bash compatibility.
autoload -U compinit
autoload -U bashcompinit
compinit
bashcompinit

setopt clobber
setopt interactivecomments
unsetopt autocd
unsetopt correct
unsetopt correct_all

ulimit -n 8192 # set shell's open file handle limit

source "$HOME/.functions.zsh"

source-if-exists "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
source-if-exists "$(brew --prefix)/etc/profile.d/z.sh"
source-if-exists "$HOME/.zprezto/init.zsh"
source-if-exists "$HOME/.zshrc.secure"
source-if-exists "$HOME/.p10k.zsh"

if command -v grit &>/dev/null; then
    eval "$(grit shell-integration)"
fi

ssh-add -A 2>/dev/null

# Godot VR Quest Dev / Android - Java via openjdk
# Didn't replace Apple's placeholder `java` if done in ~/.zshenv due to being later in $PATH
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Aliases
alias ls='ls -G'
alias ll='ls -alG'
alias less='less -R'
alias grep='grep --color=auto'
alias topm='top -o mem'
