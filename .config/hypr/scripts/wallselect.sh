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

rofi_command="rofi  -dmenu -p "wal" -normal-window -x11 -theme $HOME/.config/hypr/rofi/wallselect.rasi -theme-str ${rofi_override}"

wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n"; done | $rofi_command)

# Set wallpaper
[[ -n "$wall_selection" ]] || exit 1
killall cava
killall waybar
awww img "$HOME/.config/hypr/wallpapers/loading_smoothed_nes.gif" --transition-type outer --transition-duration 1 --transition-fps 60 --transition-step 20 && sleep 2.6
awww img "${wall_dir}"/"${wall_selection}" --transition-type center --transition-duration 1 --transition-fps 60 --transition-step 20 && sleep 0.7
wal -i "${wall_dir}"/"${wall_selection}" --contrast 4 --saturate 0 --cols16 darken

# reload swaync css
swaync-client -rs
# change obsidian color
#bash ~/.config/hypr/scripts/pywal-obsidianmd/pywal-obsidianmd.sh "/home/rifqi/gesellschaft/"

# start waybar
waybar &

## start waybar more than one monitor
#waybar -c ~/.config/waybar/config-primary &
#waybar -c ~/.config/waybar/config-secondary &

## gtk app
#gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-macchiato-blue-standard+default' && gsettings set org.gnome.desktop.interface gtk-theme 'PywalTheme'

## firefox userContent reload
bash ~/.config/hypr/scripts/firefox-userContent.sh

exit 1
