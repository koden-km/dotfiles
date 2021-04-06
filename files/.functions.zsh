function git-slug () {
  if ! URL="$(git config --get remote.origin.url)"; then
    return 1
  fi

  if [[ "$URL" =~ [:/]([^/:]+/[^/]+)\.git$ ]]; then
    echo "${match[1]}"
  elif [[ "$1" == '--fuzzy' ]]; then
    echo "???/$(basename "$(pwd)")"
  else
    return 1
  fi
}

function git {
  if [[ "$1" == "checkout" ]]; then
    echo 'ERROR: Use "git switch" or "git restore" instead' >&2
    return 1
  else
    command git "$@"
  fi
}

function source-if-exists () {
  [ -f "$1" ] && source "$1"
}

function prompt_my_hivecontext() {
  if [[ -n "$HIVE_SWARM_NAME" ]]; then
    p10k segment -i ' ' -b 15 -f 1 -t "$HIVE_SWARM_NAME"
  elif [[ -n "$DOCKER_HOST" && "$DOCKER_HOST" != "unix:///var/run/docker.sock" ]]; then
    p10k segment -i ' ' -b 15 -f 1 -t "$DOCKER_HOST"
  fi
}

function prompt_my_hiveselfcontext() {
  if [[ -z "$HIVE_SWARM_NAME" && (( -z "$DOCKER_HOST" || "$DOCKER_HOST" == "unix:///var/run/docker.sock" )) ]]; then
    p10k segment -i ' ' -b 15 -f 8 -t self
  fi
}
