if ! shopt -q login_shell && [[ -f ~/.bashrc ]]; then 
	source ~/.bashrc
elif [[ $SSH_CONNECTION ]]; then
	source ~/.bashrc
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx # -- -keeptty > ~/.xorg.log 2>&1
