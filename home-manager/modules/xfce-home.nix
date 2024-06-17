{ config, pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Tokyonight-Dark-B-LB";
      package = pkgs.tokyonight-gtk-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  xfconf.settings = {
    xfce4-desktop = {
      "configver" = 2;
      "panels" = "[<1>]";
      "panels/panel-1/background-style" = 0;
      "panels/panel-1/disable-struts" = false;
      "panels/panel-1/enter-opacity" = 80;
      "panels/panel-1/leave-opacity" = 80;
      "panels/panel-1/length" = 100;
      "panels/panel-1/length-adjust" = true;
      "panels/panel-1/mode" = 0;
      "panels/panel-1/nrows" = 1;
      "panels/panel-1/position" = "p=8;x=96;y=1055";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = 42;
      "backdrop/screen0/monitorLVDS-1/workspace0/last-image" = "{pkgs.nixos-artwork.wallpapers.stripes-logo.gnomeFilePath}";
    };
  };

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
}
