while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--up)
      # Increase volume by 5%
      wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+

      # Get current volume, convert to percentage, and send notification
      wpctl get-volume @DEFAULT_AUDIO_SINK@ | \
      awk '{print int($2*100)}' | \
      xargs -I[] notify-send -e -u low -h string:x-canonical-private-synchronous:volume_notif -h int:value:[] "Volume: []%"
      exit 0 ;;
    -d|--down)
      # Decrease volume by 5%
      wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-

      # Get current volume, convert to percentage, and send notification
      wpctl get-volume @DEFAULT_AUDIO_SINK@ | \
      awk '{print int($2*100)}' | \
      xargs -I[] notify-send -e -u low -h string:x-canonical-private-synchronous:volume_notif -h int:value:[] "Volume: []%"
      exit 0 ;;

    -m|--mute)
      # mute
      wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

      # Get new status
      STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

      # Get current volume, convert to percentage, and send notification
      if echo "$STATUS" | grep -q "MUTED"; then
        notify-send -u low "Volume: Muted"
      else
        # Extract volume percentage
        VOL=$(echo "$STATUS" | awk '{print int($2 * 100)}')
        notify-send -u low "Volume ${VOL}%"
      fi
      exit 0 ;;
    *)
      echo "Unknown option: $1"
      exit 1 ;;
  esac
done
