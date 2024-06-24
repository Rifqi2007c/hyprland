#! /bin/sh

rofi_cmd() {
	rofi -dmenu \
		-theme ~/.config/hypr/rofi/powermenu.rasi
}

chosen=$(printf "      \n⏻Shutdown\n󰜉Reboot\n󰗼Logout\n" | rofi_cmd)

case "$chosen" in

"⏻Shutdown") poweroff ;;
"󰜉Reboot") reboot ;;
"󰗼Logout") hyprctl dispatch exit ;;
*) exit 1 ;;

esac
