# requirement (Im on arch base distro - endeavoros)
 - sudo pacman -S hyprland waybar network-manager-applet dunst rofi pavucontrol imagemagick fish ranger nwg-look neovim foot ttf-0xproto-nerd slurp grim libnotify starship python-pywal
 - yay -S swww cava ttf-0xproto vimix-cursors tela-circle-icon-theme-dracula catppuccin-gtk-theme-macchiato 
 - sttt https://github.com/flick0/sttt
 - lazyvim http://www.lazyvim.org/

## waybar pywal not work?
edit style.css in ~/.config/waybar/style.css and you will find this line -> @import url('file:///home/rifqi/.cache/wal/colors-waybar.css');
- change /rifqi/ into your username
## waybar color change but the color is not what you see in the preview?
- generate wallpaper color config with this command -> wal -i ~/.config/hypr/wallpapers/phony.jpg -s (you can find all the wallpaper in hypr directory)
- generated color config can be found in ~/.cache/wal/schemes. edit it and change color0 into the right color (you can find color that was used in ~/.config/waybar/color.css)
