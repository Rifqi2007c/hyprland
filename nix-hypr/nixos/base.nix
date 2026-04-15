
{ config, pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  programs.git.enable = true;
  programs.nix-ld.enable = true;

  fonts.packages = [
    pkgs.nerd-fonts._0xproto
    pkgs.noto-fonts-cjk-sans
  ];

  environment.variables = {
    XCURSOR_THEME = "Vimix-white-cursors"; # Theme name
    XCURSOR_SIZE = "24";                     # Theme size
  };

#  services.xserver = {
#    enable = true;

#    windowManager.i3 = {
#      enable = true;
#    };
#  };
  
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-volman
    thunar-archive-plugin
  ];

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = [
   pkgs.zip
   pkgs.unzip

   pkgs.tela-circle-icon-theme
   pkgs.nwg-look
   pkgs.vimix-cursors

   pkgs.adapta-gtk-theme

   pkgs.btop
   pkgs.gvfs
   pkgs.gamescope
   pkgs.gparted

   pkgs.fastfetch
   pkgs.libnotify
   pkgs.starship
   pkgs.pywal16
   pkgs.imagemagick
   pkgs.thunar
   pkgs.openssh
   pkgs.gvfs
   pkgs.protonup-ng

   pkgs.spotify
   pkgs.obsidian
   pkgs.vesktop
 ];

 boot.supportedFilesystems = [ "ntfs" ];
 fileSystems."/mnt/windows" = {
   device = "/dev/disk/by-uuid/F076427F76424696";
   fsType = "ntfs-3g";
   options = [ "uid=1000" "gid=100" "umask=000"];
 };

 systemd.services."user@".serviceConfig.KillMode = "mixed";
 services.logind.settings.Login.killUserProcesses = true;
}


