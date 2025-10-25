if [[ $SHLVL = 1 ]]; then
  # load secure environment variables
  [ -f "$HOME/.zshenv.secure" ] && source "$HOME/.zshenv.secure"

  export EDITOR="vim"
  export VISUAL="$EDITOR"

  # Golang-related environment variables
  export GOPATH="$HOME/go"
  if [ -z ${GOPROXY} ]; then
    export GOPROXY="https://proxy.golang.org,direct"
  fi
  # note: do not set GOSUMDB
  #export GOSUMDB="off"

  # local bin and GOBIN path
  export PATH="$HOME/bin:$PATH"
  export PATH="$GOPATH/bin:$PATH"

  # Godot VR Quest Dev / Android - Java via openjdk
  # Does't replace Apple's placeholder `java` if done in ~/.zshenv due to being later in $PATH
  #export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

  # Flutter related paths
  # export PATH="$HOME/Development/sdk/flutter/bin:$PATH"

  # export less flags
  export LESS="--no-init --quit-if-one-screen --hilite-search --hilite-unread --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --window=-4"
fi
