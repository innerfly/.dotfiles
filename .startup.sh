# Keyboard illumination
#brightnessctl --device='tpacpi::kbd_backlight' set 2

# context menu
# Use ~/.Xmodmap
#xmodmap -e "keycode 157 = Menu NoSymbol Menu NoSymbol Menu"
#xmodmap -e "keycode 226 = XF86AudioPrev NoSymbol XF86AudioPrev NoSymbol XF86AudioPrev"
#xmodmap -e "keycode 231 = XF86AudioNext NoSymbol XF86AudioNext NoSymbol XF86AudioNext"

# turn off bluetooth
#rfkill block bluetooth

#sh -c 'sleep 0.1; xdotool key Menu'
