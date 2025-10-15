#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.

# Variables
rofi_theme="$HOME/.config/rofi/config-clipboard.rasi"
msg='CTRL DEL = cliphist del (entry)
ALT DEL - cliphist wipe (all)'

# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

while true; do
    result=$(
        rofi -i -dmenu \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \
            -config $rofi_theme < <(cliphist list) \
#			-mesg "$msg"
    )

    case "$?" in
        1)
            exit
            ;;
        0)
            case "$result" in
                "")
                    continue
                    ;;
                *)
                    # Copy the selected entry to the clipboard
                    cliphist decode <<<"$result" | wl-copy
                    # Give focus back to the previously active window
                    sleep 0.1

                    # Determine if the active window is a terminal (Hyprland)
                    is_terminal=0
                    is_warp=0
                    if command -v hyprctl >/dev/null 2>&1; then
                        if command -v jq >/dev/null 2>&1; then
                            awclass="$(hyprctl activewindow -j 2>/dev/null | jq -r '.class // empty')"
                        else
                            awclass="$(hyprctl activewindow -j 2>/dev/null | tr -d '\n' | sed -n 's/.*\"class\":\"\([^\"]*\)\".*/\1/p')"
                        fi
                        case "$awclass" in
                            kitty|Alacritty|foot|footclient|WezTerm|org.wezfurlong.wezterm|org.gnome.Terminal|gnome-terminal-server|kgx|com.mitchellh.ghostty|konsole|xfce4-terminal|Xfce4-terminal|tilix|Tilix|io.elementary.terminal|dev.warp.Warp|warp-terminal|io.alacritty.Alacritty)
                                is_terminal=1
                                ;;
                        esac
                        case "$awclass" in
                            dev.warp.Warp|warp-terminal)
                                is_warp=1
                                ;;
                        esac
                    fi

                    # If Warp terminal, don't auto-paste; leave content on clipboard
                    if [ "$is_warp" -eq 1 ]; then
                        exit
                    fi

                    # Try to paste automatically without requiring user paste keys
                    if command -v wtype >/dev/null 2>&1; then
                        if [ "$is_terminal" -eq 1 ]; then
                            # Terminals: Send Ctrl+Shift+V
                            #wtype -M ctrl -M shift v -m shift -m ctrl
                            wtype -M ctrl -M shift v -m shift -m ctrl
                        else
                            # Non-terminals: Send Ctrl+V
                            wtype -M ctrl v -m ctrl
                        fi
                    else
                        # No input synthesizer available; leave content on clipboard
                        :
                    fi
                    exit
                    ;;
            esac
            ;;
        10)
            cliphist delete <<<"$result"
            ;;
        11)
            cliphist wipe
            ;;
    esac
done

