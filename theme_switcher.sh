#!/bin/bash

LIGHT_THEME='Qogir-Light'
DARK_THEME='Qogir-Dark'

CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$CURRENT_SCHEME" == *"dark"* ]]; then
    dconf write /org/gnome/shell/extensions/user-theme/name "'$LIGHT_THEME'"
    gsettings set org.gnome.desktop.interface gtk-theme "$LIGHT_THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
else
    dconf write /org/gnome/shell/extensions/user-theme/name "'$DARK_THEME'"
    gsettings set org.gnome.desktop.interface gtk-theme "$DARK_THEME"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
fi
