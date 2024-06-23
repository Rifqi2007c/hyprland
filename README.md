# requirement (Im on arch base distro - endeavoros)
 - sudo pacman -S network-manager-applet dunst rofi pipewire pavucontrol imagemagick fish ranger nwg-look neovim firefox foot ttf-0xproto-nerd slurp grim libnotify starship python-pywal
 - yay -S hyprland-git swww cava ttf-0xproto vimix-cursors tela-circle-icon-theme-dracula catppuccin-gtk-theme-macchiato 
 - sttt https://github.com/flick0/sttt

## pywal on waybar not work?
edit style.css in ~/.config/waybar/style.css and you will find this line -> @import url('file:///home/rifqi/.cache/wal/colors-waybar.css');
- change /rifqi/ into your username
