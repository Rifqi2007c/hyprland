while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--up)
      brightnessctl s +10%
      
      # get brightness percentage
      bright=$(brightnessctl -m -p | awk -F, '{print $4}' | tr -d %)
      # send brightness notification
      notify-send -h int:value:$bright -h string:x-canonical-private-synchronous:brightness "Brightness" "$bright%"
      exit 0 ;;
    -d|--down)
      brightnessctl s 10%-

      bright=$(brightnessctl -m -p | awk -F, '{print $4}' | tr -d %)
      notify-send -h int:value:$bright -h string:x-canonical-private-synchronous:brightness "Brightness" "$bright%"
      exit 0 ;;
    *)
      echo "Unknown option: $1"
      exit 1 ;;
  esac
done
