
# Path to your keybinds file
KEY_FILE="$HOME/.config/waybar/scripts/keybind-cheatsheet/keycheat.txt"

# Select a keybind using rofi
selected=$(cat "$KEY_FILE" | rofi -dmenu -normal-window -p "keybinds" -x11 -theme ~/.config/waybar/scripts/keybind-cheatsheet/keycheat.rasi)

# If something was selected, grab the command (after the "::" separator)
if [[ -n "$selected" ]]; then
    cmd=$(echo "$selected" | awk -F ' :: ' '{print $2}' | xargs)
    # Execute the command in the background
    if [[ -n "$cmd" ]]; then
        eval "$cmd" &
    fi
fi
