{ pkgs, ... } : {
  home.packages = with pkgs; [
    glava
  ];
  xdg.configFile."glava/bars.glsl" = ''
    test config
  '';
}
