# Preview
![alt text](https://github.com/Rifqi2007c/hyprland/blob/main/20240624_20h30m28s_grim.png)
https://youtu.be/-Fp7HCDIeWk

# requirement (Im on arch base distro - endeavoros)
 - sudo pacman -S hyprland waybar network-manager-applet dunst rofi pavucontrol imagemagick fish nwg-look foot ttf-0xproto-nerd libnotify starship python-pywal grim slurp
 - yay -S swww cava ttf-0xproto vimix-cursors tela-circle-icon-theme-dracula catppuccin-gtk-theme-macchiato
 - sttt https://github.com/flick0/sttt
 - set fish as default shell
 - (optional) > firefox neovim ranger spotify (the waybar mediaplayer button only work with spotify but you can change that ofcourse)
   - lazyvim http://www.lazyvim.org/ (if you use neovim)
## if script didn't work (like powermenu button didn't work)
 - run the chmod.sh scripts ( > bash chmod.sh )
 - or you can do things manually ( > chmod +x <.sh> ) (all the used script can be found in hypr/scripts and waybar/scripts)
## waybar pywal not work?
edit style.css in ~/.config/waybar/style.css and you will find this line -> @import url('file:///home/rifqi/.cache/wal/colors-waybar.css');
- change /rifqi/ into your username
## waybar color change but the color is not what you see in the preview?
- generate wallpaper color config with this command -> wal -i ~/.config/hypr/wallpapers/phony.jpg -s (you can find all the wallpaper in hypr directory)
- generated color config can be found in ~/.cache/wal/schemes. edit it and change color0 into the right color (you can find color that was used in ~/.config/waybar/color.css)
# changing theme/icon/cursor
- use GTK Settings(nwg-look)
  - Widget: catppuccin-machiato-mauve-standard+default
  - default font: 0xProto Nerd Font Regular
  - color scheme: prefer dark
  - Icon: Tela Circle dracula dark
  - Cursor: Vimix Cursor - White
