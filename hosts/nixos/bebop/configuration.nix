{ pkgs, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./session-variables.nix
    ../../../nixos-modules/bundle.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.ralf2oo2.shell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.hostName = "bebop"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-l2tp
    networkmanager-openconnect
    networkmanager-openvpn
    networkmanager-sstp
    networkmanager-vpnc
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [ pkgs.distrobox ];

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  # Japanese input
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = [
    pkgs.fcitx5-mozc
    pkgs.fcitx5-gtk
    pkgs.qt6Packages.fcitx5-configtool
  ];

  # https://nixos.wiki/wiki/OBS_Studio
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
  

  boot.kernel.sysctl = {
  "kernel.sched_cfs_bandwidth_slice_us" = 3000;
  "net.ipv4.tcp_fin_timeout" = 5;
  "vm.max_map_count" = 2147483642;
};


  # apparently not needed
  #environment.variables.GLFW_IM_MODULE = "fcitx";
  #environment.variables.SDL_IM_MODULE = "fcitx";
  #environment.variables.GTK_IM_MODULE = "fcitx";
  #environment.variables.QT_IM_MODULE = "fcitx";
  
  system.stateVersion = "24.11"; # Did you read the comment?
}
