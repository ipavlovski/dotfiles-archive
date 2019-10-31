## load ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## silence the bell
xset -b

## xmodmap
## xmodmap ~/.xmodmap
setxkbmap -option ctrl:nocaps

## exec wm
exec startxfce4
