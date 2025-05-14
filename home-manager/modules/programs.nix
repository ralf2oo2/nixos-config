{pkgs, ...} : {
  home.packages = with pkgs; [
    prismlauncher
    haruna
    mpv
    piper
    solaar
    flameshot
    vscode-fhs
    jetbrains.idea-community
    anki
    thunderbird
    krita
    aseprite
    chatterino7
    dconf-editor
    mission-center
    ventoy-full-gtk
    hardinfo2
  ];
}