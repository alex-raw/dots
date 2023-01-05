#!/usr/bin/env sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
xsetroot -cursor_name left_ptr &
udiskie &
dunst &
nm-applet &
volumeicon &
redshift &
unclutter &
remaps

picom --experimental-backends &

cd ~/Data/Teaching/22ws_lexical_semantics/Website && watchexec -p -N \
    --log-file ~/Data/Teaching/22ws_lexical_semantics/Website/log.log \
    -i 21ss_LoLA_Rauhut.Rmd \
    --exts draft,Rmd,yml \
    make &

exec leftwm
