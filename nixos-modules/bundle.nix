{ pkgs, ... }: {
  imports = [
    ./bootloader.nix
    ./user.nix
    #./xfce.nix
    ./sound.nix
    ./bluetooth.nix
    #./xfconf.nix
    ./git.nix
    ./nvidia.nix
    ./cinnamon.nix
    ./steam.nix
    ./java.nix
    ./filesystem.nix
    #./pinta.nix
    ./appimage.nix
    ./wine.nix
    # ./hyprland.nix
    ./discord.nix
    ./unpackaged/bundle.nix
    # ./wayfire.nix
    ./wacom.nix
    ./background/background.nix
  ];

  environment.systemPackages = [
    (pkgs.callPackage ./manatan.nix { })
  ];
}
