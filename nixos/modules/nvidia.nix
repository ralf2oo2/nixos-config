{ config, lib, pkgs, ... } : {
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;

    # Enable the nvidia settings menu, accessable via nvidia-settings
    nvidiaSettings = true;

    #Optionally, you may need to select te appropriate driver version for your specific gpu
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
