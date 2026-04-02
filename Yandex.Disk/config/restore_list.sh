#!/bin/bash
# Install missing packages from packages_thinkpad.txt using paru

PACKAGE_LIST="./packages_thinkpad.txt"

missing=$(comm -23 <(sort "$PACKAGE_LIST") <(pacman -Qq | sort))

if [[ -z "$missing" ]]; then
    echo "All packages are already installed!"
    exit 0
fi

echo "Missing packages: $(echo "$missing" | wc -l)"
echo "$missing" | paru -S --noconfirm -
