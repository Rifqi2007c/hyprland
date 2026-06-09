rofi_cmd() {
  rofi -dmenu -normal-window -p "power" -x11 -theme ~/.config/hypr/rofi/powermenu.rasi
}

chosen=$(printf "      \n⏻Shutdown\n󰜉Reboot\n󰗼Logout\n" | rofi_cmd)

case "$chosen" in

"⏻Shutdown") poweroff ;;
"󰜉Reboot") reboot ;;
"󰗼Logout") hyprctl dispatch 'hl.dsp.exit()' ;;
*) exit 1 ;;

esac
