if ! shopt -q login_shell && [[ -f ~/.bashrc ]]; then 
	source ~/.bashrc
elif [[ $SSH_CONNECTION ]]; then
	source ~/.bashrc
fi

export TMP=/tmp/$(date +"%F")
mkdir -p $TMP

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx # -- -keeptty > ~/.xorg.log 2>&1
