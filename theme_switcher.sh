#!/bin/bash

# Check if a parameter was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <light|dark>"
    exit 1
fi

MODE="$1"

if [ "$MODE" == "dark" ]; then
    THEME='Tokyonight-Dark'
    COLOR_SCHEME='prefer-dark'
    NIGHT_LIGHT=false
elif [ "$MODE" == "light" ]; then
    THEME='Gruvbox-Light'
    COLOR_SCHEME='default'
    NIGHT_LIGHT=false
fi

# restart telegram
#pkill -f -i 'telegram' && nohup Telegram &

dconf write /org/gnome/shell/extensions/user-theme/name "'$THEME'"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled $NIGHT_LIGHT