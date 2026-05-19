{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-docklike-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin
    pkgs.file-roller
    ulauncher
  ];

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
}
