{
  home.file.".config/hypr/hyprpaper/wallpapers/bliss.jpg" = {
    source = ./wallpapers/bliss.jpg;
  };
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload =
      [ "/home/<user>/.config/hypr/hyprpaper/wallpapers/bliss.jpg" ];

    wallpaper = [
      "DP-4,/home/<user>/.config/hypr/hyprpaper/wallpapers/bliss.jpg"
      "HDMI-A-6,/home/<user>/.config/hypr/hyprpaper/wallpapers/bliss.jpg"
    ];
  };
}