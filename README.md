# Preview
![alt text](https://github.com/Rifqi2007c/hyprland/blob/main/asset/20240702_22h52m26s_grim.png)

# requirement (Im on arch base distro - endeavoros)
 - package installer
```
sudo pacman -S git hyprland waybar network-manager-applet dunst rofi pavucontrol imagemagick fish nwg-look foot ttf-nerd-fonts-symbols ttf-0xproto-nerd libnotify starship python-pywal grim slurp noto-fonts-cjk
```
- AUR helper
```
yay -S swww cava ttf-0xproto vimix-cursors tela-circle-icon-theme-dracula catppuccin-gtk-theme-macchiato
```
- sttt https://github.com/flick0/sttt
 - set fish as default shell
 - (optional) > thunar neovim libsixel peaclock calcurse htop spotify (the waybar mediaplayer button only work with spotify but you can change that ofcourse)
```
sudo pacman -S thunar neovim libsixel htop
```
```
yay -S spotify peaclock calcurse libsixel-git
```
   - ![lazyvim](http://www.lazyvim.org/) (if you use neovim)
   - ![my custom neofetch](https://github.com/Rifqi2007c/neofetch-custom)
- cd into ~/.config/hypr/scripts and chmod +x everything
```
cd ~/.config/hypr/scripts
chmod +x cava.sh gamemode.sh notify-send.sh powermenu.sh volume.sh wallselect.sh waybar.sh
```
## waybar pywal not work?
pywal will not work out of the box here a way to fix this
- generate pywal color for all the wallpapers first. for example...
```
wal -i ~/.config/hypr/wallpapers/phony.jpg -s
```
or using wallpaper switcher shortcut `SUPER+w`
### waybar pywal
- edit the waybar style.css
```
@import url('file:///home/rifqi/.cache/wal/colors-waybar.css');
```
change rifqi into your username

# changing theme/icon/cursor
- use GTK Settings(nwg-look)
  - Widget: catppuccin-machiato-mauve-standard+default
  - default font: 0xProto Nerd Font Regular
  - color scheme: prefer dark
  - Icon: Tela Circle dracula dark
  - Cursor: Vimix Cursor - White
 
# extra
 - [custom firefox css made by me](https://github.com/Rifqi2007c/firefox-css)
```
git clone https://github.com/Rifqi2007c/firefox-css.git
```
