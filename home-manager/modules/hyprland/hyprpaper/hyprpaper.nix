{config, ...}:{
  home.file.".config/hypr/hyprpaper/wallpapers/bliss.jpg" = {
    source = ./wallpapers/bliss.jpg;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "${config.home.homeDirectory}/.config/hypr/hyprpaper/wallpapers/bliss.jpg" ];

      wallpaper = [
        "DP-4,${config.home.homeDirectory}/.config/hypr/hyprpaper/wallpapers/bliss.jpg"
        "HDMI-A-6,${config.home.homeDirectory}/.config/hypr/hyprpaper/wallpapers/bliss.jpg"
      ];
    };
  };
}