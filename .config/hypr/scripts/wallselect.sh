cacheDir="$HOME/wallcache"
wall_dir="$HOME/.config/hypr/wallpapers"

if [ ! -d "${cacheDir}" ]; then
	mkdir -p "${cacheDir}"
fi

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$imagen" ]; then
		nombre_archivo=$(basename "$imagen")
		if [ ! -f "${cacheDir}/${nombre_archivo}" ]; then
			convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
		fi
	fi
done

rofi_command="rofi -dmenu -theme $HOME/.config/hypr/rofi/wallselect.rasi -theme-str ${rofi_override}"

wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n"; done | $rofi_command)

# Set wallpaper
[[ -n "$wall_selection" ]] || exit 1
killall cava
killall waybar
swww img "$HOME/.config/hypr/wallpapers/loading.gif" --transition-type outer --transition-duration 1 --transition-fps 60 --transition-step 20 && sleep 2.5
swww img "${wall_dir}"/"${wall_selection}" --transition-step 20 --transition-fps 60 --transition-type center --transition-duration 1
wal -i "${wall_dir}"/"${wall_selection}" -s
waybar
exit 0
