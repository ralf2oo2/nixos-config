{
  boot.supportedFilesystems = ["ntfs"];
  fileSystems = {
    "/mnt/windowsDrive" = {
      device = "/dev/disk/by-uuid/EA2E0CF42E0CBC17";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=1000"
        "auto"
      ];
    };

    "/mnt/m2GamingDrive" = {
      device = "/dev/disk/by-uuid/724ADD354ADCF737";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=1000"
        "auto"
      ];
    };

    "/mnt/dataDrive" = {
      device = "/dev/disk/by-uuid/3EC42D6BC42D269D";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=1000"
        "auto"
      ];
    };

    "/mnt/hddGamesSmallDrive" = {
      device = "/dev/disk/by-uuid/BE44C04D44C00A5B";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=1000"
        "auto"
      ];
    };
  };
}