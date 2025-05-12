{ lib, pkgs, ... }: {
  environment.sessionVariables = {
    FLAKE = "/home/ralf2oo2/nixos/";
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.xorg.libXxf86vm
    ];
  };
}
