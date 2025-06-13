{ lib, pkgs, ... }: {
  environment.sessionVariables = {
    NH_FLAKE = "/home/ralf2oo2/nixconfig/";
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.xorg.libXxf86vm
    ];
  };
}
