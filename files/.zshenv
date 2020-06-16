if [[ $SHLVL = 1 ]]; then
  # load secure environment variables
  source "$HOME/.zshenv.secure"

  export EDITOR="vim"
  export VISUAL="$EDITOR"

  # Golang-related environment variables
  export GOPATH="$HOME/go"
  export GOPROXY="direct"
  export GOSUMDB="off"

  # local bin and GOBIN path
  export PATH="$HOME/bin:$PATH"
  export PATH="$GOPATH/bin:$PATH"

  # export less flags
  export LESS="--quit-if-one-screen --hilite-search --hilite-unread --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines  --window=-4"
fi
