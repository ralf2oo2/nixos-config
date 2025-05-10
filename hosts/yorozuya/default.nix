{
  inputs,
  lib,
  ...
}:
let
in
{
  imports = [
    #
    # ========== Hardware ==========
    #
    ./hardware-configuration.nix
    #inputs.hardware.nixosModules.common-cpu-intel
    #inputs.hardware.nixosModules.common-gpu-nvidia

    #
    # ========== Misc Inputs ==========
    #

    (map lib.custom.relativeToRoot [
      #
      # ========== Required Configs ==========
      #
      "hosts/common/core"

      #
      # ========== Non-Primary Users to Create ==========
      #


      #
      # ========== Optional Configs ==========
      #
	  "hosts/common/optional/xfce.nix"
    ])
  ];

  #
  # ========== Host Specification ==========
  #

  hostSpec = {
    hostName = "yorozuya";
  };

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };

  boot.initrd = {
    systemd.enable = true;
  };

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}