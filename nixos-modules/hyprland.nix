{pkgs, inputs, system, ...} :{
  programs.hyprland = {    
    enable = true;    
    xwayland.enable = true;
  }; 
  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
    pkgs.wofi
    pkgs.hyprpaper
    pkgs.hyprland-autoname-workspaces

    #move quickshell config to separate file
    (inputs.quickshell.packages.${system}.quickshell.withModules [
      pkgs.kdePackages.qt5compat
      pkgs.kdePackages.qtimageformats
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
    ])
  ];
}