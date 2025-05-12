{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot = {
      enable = true;

      windows = {
      "sda1" = 
      let
        boot-drive = "FS0";
      in
      {
        title = "Windows 11";
        efiDeviceHandle = boot-drive;
        sortKey = "a_windows";
      };
    };

      edk2-uefi-shell.enable = true;
      edk2-uefi-shell.sortKey = "z_edk2";
    };
  };
}
