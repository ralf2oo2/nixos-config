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
  };
}