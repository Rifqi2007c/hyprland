#!/bin/bash

# Function to display the notification

ART_FILE="/tmp/spotify_album_art.png"

display_notification() {
  ARTIST=$(playerctl metadata artist)
  TITLE=$(playerctl metadata title)
  ALBUM=$(playerctl metadata album)
  # Get album art URL via playerctl, if available
  ART_URL=$(playerctl metadata mpris:artUrl)

  curl -s "$ART_URL" -o "$ART_FILE"

  # Use notify-send to push the notification
  # -i option can take a file path or URL for the icon/image
  notify-send "Now Playing:" "<b>$TITLE</b>\n<i>by</i> <b>$ARTIST</b> <i>from</i> <b>$ALBUM</b>" -i "$ART_FILE" -t 5000
}

# Check if Spotify is running and is the active player
if [ "$(playerctl -p spotify status 2>/dev/null)" == "Playing" ] || [ "$(playerctl -p spotify status 2>/dev/null)" == "Paused" ]; then
  display_notification
else
  # Optional: notify if Spotify is not running/playing
  # notify-send "Spotify" "Not currently playing music."
  exit 1
fi
