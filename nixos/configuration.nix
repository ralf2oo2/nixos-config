{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./session-variables.nix
    ./modules/bundle.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  # Japanese input
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = [
    pkgs.fcitx5-mozc
    pkgs.fcitx5-gtk
    pkgs.fcitx5-configtool
  ];


  # apparently not needed
  #environment.variables.GLFW_IM_MODULE = "fcitx";
  #environment.variables.SDL_IM_MODULE = "fcitx";
  #environment.variables.GTK_IM_MODULE = "fcitx";
  #environment.variables.QT_IM_MODULE = "fcitx";
  
  system.stateVersion = "24.11"; # Did you read the comment?
}
