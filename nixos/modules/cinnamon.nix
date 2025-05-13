{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.lightdm.enable = true;
    desktopManager = {
      cinnamon.enable = true;
    };
    displayManager.defaultSession = "cinnamon";
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-docklike-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin
    pkgs.file-roller
    ulauncher
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}