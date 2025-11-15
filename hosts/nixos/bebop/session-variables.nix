{ lib, pkgs, ... }: {
  environment.sessionVariables = {
    NH_FLAKE = "/home/ralf2oo2/nixconfig/";
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.xorg.libXxf86vm
      pkgs.openal
      pkgs.glfw2
      pkgs.libpulseaudio
      pkgs.xorg.libXrender
      pkgs.xorg.libXtst
      pkgs.xorg.libXi
      pkgs.xorg.libXcursor
      pkgs.xorg.libXrandr
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libpulseaudio
      openal
      glfw2
    ];
  };
}