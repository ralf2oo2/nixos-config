{pkgs, ...} : {
  home.packages = with pkgs; [
    prismlauncher
    haruna
    mpv
  ];
}
