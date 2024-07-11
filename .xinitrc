#!/usr/bin/env sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

if [[ "$HOSTNAME" = "rawptop" ]]; then
    touchpad &
    clight &
    cbatticon &
    volumeicon &
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
xsetroot -cursor_name left_ptr &
udiskie &
dunst &
nm-applet &
redshift &
unclutter &
remaps
picom --experimental-backends &

exec leftwm
