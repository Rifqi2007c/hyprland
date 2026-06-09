DIR="$HOME/Pictures"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

# Check if directory exists, if not create it
mkdir -p "$DIR"

# Capture region and copy to clipboard + save to file
grim -g "$(slurp)" - | tee "$DIR/$NAME"

# Optional: send a notification
notify-send "Screenshot Saved" "Saved to $DIR/$NAME" -i "$DIR/$NAME"
