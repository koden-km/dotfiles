if [ -x grit ]; then

	# Setup grit shell integration:
	# $ eval "$(grit shell-integration)"
	# Or manually put the output of 'grit shell-integration' below to avoid running eval.

	# ---Begin Manual---
	grit() {
		local file="$(mktemp)"
		trap "rm -f '$file'" EXIT
		"/Users/kevin/bin/grit" --with-shell-integration="$file" "$@" && source "$file"
		return $?
	}

	# Setup autocompletion using the real binary.
	_grit_bash_autocomplete() {
		local cur opts base
		COMPREPLY=()
		cur="${COMP_WORDS[COMP_CWORD]}"
		opts=$(GRIT_COMP_WORDS="${COMP_WORDS[@]}" "/Users/kevin/bin/grit" ${COMP_WORDS[@]:1:$COMP_CWORD} --generate-bash-completion)
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		return 0
	}

	complete -F _grit_bash_autocomplete grit
	# ---End Manual---

fi
