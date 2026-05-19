{pkgs, pkgs-stable, ...} : {
  home.packages = [
    pkgs.prismlauncher
    pkgs.haruna
    pkgs.mpv
    pkgs.piper
    pkgs.solaar
    (pkgs.flameshot.overrideAttrs (old: {
      cmakeFlags = old.cmakeFlags or [ ] ++ [ "-DUSE_WAYLAND_GRIM=ON" ];
    })) 
    pkgs.vscode-fhs
    pkgs-stable.jetbrains.idea-oss
    pkgs-stable.anki
    pkgs-stable.lutris
    pkgs-stable.bottles
    pkgs.thunderbird
    pkgs.krita
    pkgs.aseprite
    pkgs-stable.chatterino7
    pkgs.dconf-editor
    pkgs.mission-center
    pkgs.hardinfo2
    pkgs.rustdesk
    pkgs.mediawriter
    pkgs.dino
    pkgs.streamlink
    pkgs.resources
    pkgs.melonds
    pkgs.gpick
    pkgs.p7zip
    pkgs.peazip
    pkgs.blockbench
    pkgs.pinta
    pkgs.obs-studio
    pkgs.kdePackages.ark
    pkgs.imhex
    pkgs.jetbrains.rider
    pkgs.protonplus
    pkgs.limo
    pkgs.kdePackages.kate
    (import ./intellijmc.nix {inherit pkgs;})
  ];
}
