### BASHRC ###

## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## LOCALE
if [[ $(type locale 2>/dev/null) && $(grep en_CA <(locale -a)) ]]; then 
    export LC_ALL=en_CA.UTF-8
    export LANG=en_CA.UTF-8
fi

# HISTORY
# shopt -s histappend
export HISTTIMEFORMAT="%F %T " # Add timestamp to history
# export HISTCONTROL=ignorespace
export HISTFILESIZE=999999
export HISTSIZE=999999

## update rows and columns after each command
shopt -s checkwinsize

# Use pattern '**' to match everything
shopt -s globstar

## ALIASES

## PATH
export PATH=$PATH:~/bin


## VARS
export sdcard="/mnt/chromeos/removable/200GB"


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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
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
# export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}: ${PWD##*/}\007"'
## [ -z "$TMUX"  ] && { tmux attach-session -d -t local || exec tmux new-session -s local; }
[[ -z "$TMUX"  ]] && { tmux new-session -A -s main; }
## tmux new-session -A -s main
