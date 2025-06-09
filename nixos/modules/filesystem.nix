{
  fileSystems = {
    "/mnt/windowsDrive" = {
      device = "/dev/disk/by-uuid/6b37c152-ce9c-4da9-8fd1-552d45fdb272";
      fsType = "ntfs";
      options = [
        "users" # Allows any user to mount and unmount
        "nofail" # Prevent system from failing if this drive doesn't mount
      ];
    };

    "/mnt/m2GamingDrive" = {
      device = "/dev/disk/by-uuid/1432159d-bcd7-4ffc-912b-7d847105b360";
      fsType = "ntfs";
      options = [
        "users" # Allows any user to mount and unmount
        "nofail" # Prevent system from failing if this drive doesn't mount
      ];
    };

    "/mnt/dataDrive" = {
      device = "/dev/disk/by-uuid/72aec4b8-cf7b-4d16-89c4-c18ca67b0288";
      fsType = "ntfs";
      options = [
        "users" # Allows any user to mount and unmount
        "nofail" # Prevent system from failing if this drive doesn't mount
      ];
    };

    "/mnt/hddGamesSmallDrive" = {
      device = "/dev/disk/by-uuid/46108dda-8428-4216-ae2f-143f81a920df";
      fsType = "ntfs";
      options = [
        "users" # Allows any user to mount and unmount
        "nofail" # Prevent system from failing if this drive doesn't mount
      ];
    };
  };
}