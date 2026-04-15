{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [
   pkgs.grim
   pkgs.slurp

   pkgs.kitty
   pkgs.rofi
   pkgs.waybar
   pkgs.awww
   pkgs.swaynotificationcenter
   pkgs.networkmanagerapplet
   pkgs.pavucontrol
 ];
}
