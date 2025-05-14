{ pkgs, ... }: {
  home.sessionVariables.GTK_THEME = "Qogir-Dark";
  
  home.sessionVariables = {
    XCURSOR_THEME = "OpenZone_Fire_Slim";
  };
  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=OpenZone_Fire_Slim
  '';

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Qogir-Dark";
      package = pkgs.qogir-theme;
    };
    cursorTheme = {
      name = "OpenZone_Fire_Slim";
      package = pkgs.openzone-cursors;
    };
    font = {
      name = "Roboto 9";
      package = pkgs.roboto;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}