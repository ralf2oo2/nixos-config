{ pkgs, inputs, ... }:
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

  imports = [inputs.silentSDDM.nixosModules.default];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    silentSDDM = {
      enable = true;
      theme = "default";
    };
  };
}