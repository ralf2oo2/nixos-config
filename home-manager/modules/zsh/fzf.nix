{pkgs, ...} : {
  fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  zsh.plugins = [
    {
      name = "fzf-tab";
      src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    }
    {
      name = "fzf-history-search";
      src = "${pkgs.zsh-fzf-history-search}/share/fzf-history-search";
    }
  ];
}