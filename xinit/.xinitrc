export XDG_CURRENT_DESKTOP=bspwm
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=bspwm
slstatus &
picom --config ~/.config/picom/picom.conf &
~/.config/wallpapers/.fehbg &
exec polybar --config="~/.config/polybar/config.ini" &
setxkbmap -layout us,hu -option 'grp:alt_shift_toggle' &
dunst &
sxhkd &
flameshot &
greenclip daemon &
xautolock -time 5 -locker "betterlockscreen -l blur" &
exec bspwm
