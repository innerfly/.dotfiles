#!/bin/bash

CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$CURRENT_SCHEME" == *"dark"* ]]; then
    THEME='Qogir-Dark'
    COLOR_SCHEME='default'
    NIGHT_LIGHT=false
else
    THEME='Qogir-Light'
    COLOR_SCHEME='prefer-dark'
    NIGHT_LIGHT=false
fi

# restart telegram
#pkill -f -i 'telegram' && nohup Telegram &

dconf write /org/gnome/shell/extensions/user-theme/name "'$THEME'"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled $NIGHT_LIGHT