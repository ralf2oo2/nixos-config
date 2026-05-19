{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      cinnamon.enable = true;
    };
  };

  services.displayManager = {
    sddm.enable = true;
    defaultSession = "cinnamon";
  };

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.file-roller
    #ulauncher
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}