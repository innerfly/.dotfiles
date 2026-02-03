#!/bin/bash

CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$CURRENT_SCHEME" == *"dark"* ]]; then
    MODE="light"
else
    MODE="dark"
fi

if [ "$MODE" == "dark" ]; then
    #THEME='Gruvbox-Dark'
    THEME='WhiteSur-Dark-solid'
    COLOR_SCHEME='prefer-dark'
    NIGHT_LIGHT=false
elif [ "$MODE" == "light" ]; then
    THEME='WhiteSur-Light-solid'
    COLOR_SCHEME='default'
    NIGHT_LIGHT=false
fi

# restart telegram
#pkill -f -i 'telegram' && nohup Telegram &

dconf write /org/gnome/shell/extensions/user-theme/name "'$THEME'"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled $NIGHT_LIGHT