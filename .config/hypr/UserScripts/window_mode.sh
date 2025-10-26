#!/usr/bin/env bash
# Prints the active window's tiling mode for Waybar
# Additionally, if the active app has more than 1 window open, append that count
# Output examples:
#  " 2" (tiled, two windows of this app), "󰒅" (floating, single), " 3" (fullscreen, three)
# Falls back to short text if nerd fonts not available: [F], [T], [FS]

# Helper to print the icon
print_icon() {
  local icon="$1"
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

# Decide the mode icon first
mode_icon=""
if [[ $fs -eq 1 ]]; then
  mode_icon=""
else
  case "$floating" in
    true|1|"1")
      mode_icon="󰒅"
      ;;
    *)
      mode_icon=""
      ;;
  esac
fi

# Determine how many windows of the same app (class) are open
app_class=$(jq -r '.class // .initialClass // empty' <<<"$json" 2>/dev/null)
count_suffix=""
if [[ -n "$app_class" ]]; then
  clients_json=$(hyprctl clients -j 2>/dev/null)
  if [[ -n "$clients_json" && "$clients_json" != "null" ]]; then
    win_count=$(jq --arg cls "$app_class" '[.[] | select(.class == $cls and (.mapped == true or .mapped == 1))] | length' <<<"$clients_json" 2>/dev/null)
    if [[ -n "$win_count" && "$win_count" =~ ^[0-9]+$ && $win_count -gt 1 ]]; then
      count_suffix=" $win_count"
    fi
  fi
fi

# Print icon with optional count suffix
print_icon "${mode_icon}${count_suffix}"
