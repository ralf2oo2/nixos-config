{ lib, pkgs, ... }: {
  environment.sessionVariables = {
    NH_FLAKE = "/home/ralf2oo2/nixconfig/";
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.libxxf86vm
      pkgs.openal
      pkgs.glfw2
      pkgs.libpulseaudio
      pkgs.libxrender
      pkgs.libxtst
      pkgs.libxi
      pkgs.libxcursor
      pkgs.libxrandr
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