### BASHRC ###

## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## stty lockup
stty -ixon

## LOCALE
if [[ $(type locale 2>/dev/null) && $(grep en_CA <(locale -a)) ]]; then 
    export LC_ALL=en_CA.UTF-8
    export LANG=en_CA.UTF-8
fi

# HISTORY
# from https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend
shopt -s cmdhist
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

## for C-x C-e and fc
export EDITOR=vim

## update rows and columns after each command
shopt -s checkwinsize

# Use pattern '**' to match everything
shopt -s globstar

## do not auto-escape variables '\$' on complete
shopt -s direxpand

## ALIASES

## PATH
export PATH=$PATH:~/.local/bin
# export PATH=$PATH:/usr/lib/jvm/java-11-openjdk/bin

## VARS
export sdcard="/run/media/ip/200GB"
export scratches="$HOME/.config/JetBrains/IntelliJIdea2020.1/scratches"
export blog="$HOME/projects/codeblog/source/_drafts/"
export MANPAGER=cat

## PS1
function parse_dir() {
    read match < <(
	for i in $(printenv | \grep '^[[:lower:]]'); do
	    name=${i%%=*}
	    path=${i##*=}
	    truncated=${PWD##$path}
	    echo ${#truncated} $name $truncated
	done | sort -n | head -1
    )

    # If the length of $PWD does not change -> do not trim
    if [[ ${#PWD} -eq $(awk '{print $1}' <<<$match) ]]; then
	echo "$PWD"
    else
	awk '{printf "\033[35m$%s\033[36m%s", $2, $3}' <<<$match
    fi   
}

# PS1='\e\[\033[1;34m\]\n::: \[\033[1;32m\]\u\[\033[1;34m\]@\[\033[1;31m\]\h\[\033[1;34m\] ::: $(parse_dir)\n\$ \[\033[0m\]'
PS1='\e\[\033[1;34m\]::: \[\033[1;32m\]\u\[\033[1;34m\]@\[\033[1;31m\]\h\[\033[1;34m\] ::: $(parse_dir)\n\$ \[\033[0m\]'

function export_subdirs() {
    local dir
    for dir in $(ls $1); do export $dir="${1}/${dir}"; done
}

# [ -d ~/projects ] && export_subdirs ~/projects
export_subdirs ~


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

## aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

## bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## tmux
[[ -z "$TMUX"  ]] && { tmux new-session -A -s a; }

