{pkgs, inputs, system, ...} :{
  programs.hyprland = {    
    enable = true;    
    xwayland.enable = true;
  }; 
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
    pkgs.wofi
    pkgs.hyprpaper
    pkgs.hyprland-autoname-workspaces
    pkgs.hyprlock
    pkgs.swaynotificationcenter

    #move quickshell config to separate file
    (inputs.quickshell.packages.${system}.quickshell.withModules [
      pkgs.kdePackages.qt5compat
      pkgs.kdePackages.qtimageformats
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
    ])
  ];
}