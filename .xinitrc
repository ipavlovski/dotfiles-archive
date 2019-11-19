## load ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## silence the bell
xset -b

## keyboard layout
setxkbmap -option ctrl:nocaps

## key shortcuts
xbindkeys

## exec wm
exec startxfce4
