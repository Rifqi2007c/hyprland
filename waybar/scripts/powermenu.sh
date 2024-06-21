#! /bin/sh
wofi_cmd() {
	wofi --show dmenu -c ~/.config/wofi/custom/powermeu.conf -s ~/.config/wofi/custom/style.css

}

chosen=$(printf "⏻Shutdown\n󰜉Reboot\n󰗼Logout" | wofi_cmd)

case "$chosen" in

"⏻Shutdown") poweroff ;;
"󰜉Reboot") reboot ;;
"󰗼Logout") hyprctl dispatch exit ;;
*) exit 1 ;;
esac
