#!/usr/bin/env bash
# Usage: run-or-focus.sh class app_command

CLASS="$1"
shift
CMD="$@"

# Check if window with this class exists
WIN=$(hyprctl clients -j | jq -r --arg CLASS "$CLASS" '
  .[] | select(.class == $CLASS) | .address' | head -n1)

if [ -n "$WIN" ]; then
    # Focus it
    hyprctl dispatch focuswindow address:"$WIN"
else
    # Launch it
    $CMD &
fi
