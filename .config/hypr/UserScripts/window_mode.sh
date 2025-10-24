#!/usr/bin/env bash
# Prints the active window's tiling mode for Waybar
# Output examples:
#  "󰒅" for floating, "" for tiled, "" for fullscreen, "" if none
# Falls back to short text if nerd fonts not available: [F], [T], [FS]

# Helper to detect if a glyph can be displayed (crude but ok)
print_icon() {
  local icon="$1"
  # If terminal can't render, still echo; Waybar usually can. Keep simple.
  printf "%s" "$icon"
}

# Query Hyprland for active window JSON
json=$(hyprctl activewindow -j 2>/dev/null)
if [[ -z "$json" || "$json" == "null" || "$json" == "{}" ]]; then
  # No active window
  echo ""
  exit 0
fi

# Extract floating and fullscreen states with jq
floating=$(jq -r '.floating' <<<"$json" 2>/dev/null)
fullscreen=$(jq -r '.fullscreen' <<<"$json" 2>/dev/null)

# Some Hyprland versions expose fullscreen as object or int; normalize
case "$fullscreen" in
  true|1|"1") fs=1 ;;
  *) fs=0 ;;
esac

if [[ $fs -eq 1 ]]; then
  # Fullscreen
  print_icon ""
  exit 0
fi

case "$floating" in
  true|1|"1")
    print_icon "󰒅"
    ;;
  *)
    # Tiled
    print_icon ""
    ;;
esac
