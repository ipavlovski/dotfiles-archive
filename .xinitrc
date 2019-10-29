## load ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## silence the bell
xset -b

## xmodmap
xmodmap ~/.xmodmap

## exec wm
exec startxfce4
