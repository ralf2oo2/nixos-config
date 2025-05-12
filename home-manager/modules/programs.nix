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
  ];
}
