{ config, pkgs, ... }:

{
  home.username = "rifqi";
  home.homeDirectory = "/home/rifqi";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.vimix-cursors;
    name = "Vimix-white-cursors";
    size = 24;
  };
}
