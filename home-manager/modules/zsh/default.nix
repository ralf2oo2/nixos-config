{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    antidote = {
      enable = true;
      plugins = [''
          romkatv/powerlevel10k
      ''];
    };
  };

  home.file.".p10k.zsh" = {
    source = ./p10k.zsh;
    executable = true;
  };
}