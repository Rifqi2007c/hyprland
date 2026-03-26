playerctl --follow metadata mpris:trackid | while read -r; do
  ~/.config/hypr/scripts/player-notification/player-notification.sh
done
