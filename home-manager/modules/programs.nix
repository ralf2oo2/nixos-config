{pkgs, pkgs-stable, ...} : {
  home.packages = [
    pkgs.prismlauncher
    pkgs.haruna
    pkgs.mpv
    pkgs.piper
    pkgs.solaar
    pkgs.flameshot
    pkgs.vscode-fhs
    pkgs-stable.jetbrains.idea-community
    pkgs.anki
    pkgs.thunderbird
    pkgs.krita
    pkgs.aseprite
    pkgs-stable.chatterino7
    pkgs.dconf-editor
    pkgs.mission-center
    #ventoy-full-gtk insecure rip
    pkgs.hardinfo2
    pkgs.rustdesk
    pkgs.mediawriter
    pkgs.dino
    pkgs.streamlink
    pkgs.whatsie
    pkgs.resources
    pkgs.melonDS
    pkgs.gpick
    pkgs.p7zip
    pkgs.peazip
    pkgs.blockbench
    #pkgs-stable.quickbms #doesn't build
  ];
}
