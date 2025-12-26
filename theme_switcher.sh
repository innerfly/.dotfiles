#!/bin/bash

# Check if a parameter was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <light|dark>"
    exit 1
fi

MODE="$1"

if [ "$MODE" == "dark" ]; then
    THEME='WhiteSur-Dark-nord'
    COLOR_SCHEME='prefer-dark'
#    NIGHT_LIGHT=true    
elif [ "$MODE" == "light" ]; then
    THEME='WhiteSur-Light'
    COLOR_SCHEME='default'
    NIGHT_LIGHT=false
fi

dconf write /org/gnome/shell/extensions/user-theme/name "'$THEME'"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled $NIGHT_LIGHT