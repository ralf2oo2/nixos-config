{
  imports = [
    ./p10k/default.nix
    ./fzf.nix
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  # home.file.".p10k.zsh" = {
  #   source = ./p10k.zsh;
  #   executable = true;
  # };
}