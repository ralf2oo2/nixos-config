{ config, pkgs, lib, ... }:
{
  imports = [
    ./css.nix
    ./glava.nix
    ./picom/picom.nix
    ./ulauncher/ulauncher.nix
    ./conky/conky.nix
    ./docklike/docklike.nix
  ];

  home.packages = with pkgs; [
    meslo-lgs-nf
    notepadqq
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      #name = "Tokyonight-Dark-B-LB";
      #package = pkgs.tokyonight-gtk-theme;
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
  home.pointerCursor = {
    name = "OpenZone_Fire_Slim";
    package = pkgs.openzone-cursors;
    x11.enable = true;
    gtk.enable = true;
  };
  xfconf.settings = {
    xfce4-panel = {
      "configver" = 2;
      "panels" = [1 2];

      "panels/panel-1/background-style" = 0;
      "panels/panel-1/disable-struts" = false;
      "panels/panel-1/enter-opacity" = 80;
      "panels/panel-1/leave-opacity" = 80;
      "panels/panel-1/length" = 100;
      "panels/panel-1/length-adjust" = true;
      "panels/panel-1/mode" = 0;
      "panels/panel-1/nrows" = 1;
      "panels/panel-1/output-name" = "Primary";
      "panels/panel-1/position" = "p=8;x=96;y=1055";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = 46;
      "panels/panel-1/plugin-ids" = [1 2 3 4 5 6 7 8];

      "panels/panel-2/background-style" = 0;
      "panels/panel-2/disable-struts" = false;
      "panels/panel-2/enter-opacity" = 80;
      "panels/panel-2/leave-opacity" = 80;
      "panels/panel-2/length" = 100;
      "panels/panel-2/length-adjust" = true;
      "panels/panel-2/mode" = 0;
      "panels/panel-2/nrows" = 1;
      "panels/panel-2/output-name" = "HDMI-1";
      "panels/panel-2/position" = "p=8;x=96;y=1055";
      "panels/panel-2/position-locked" = true;
      "panels/panel-2/size" = 46;
      "panels/panel-2/plugin-ids" = [2];

     	"plugins/plugin-1" = "whiskermenu";
			"plugins/plugin-2" = "docklike";
			
			"plugins/plugin-3" = "separator";
			"plugins/plugin-3/expand" = true;
			"plugins/plugin-3/style" = 0;

			"plugins/plugin-4" = "systray";
			"plugins/plugin-4/hide-new-items" = false;
			"plugins/plugin-4/icon-size" = 16;
      #"plugins/plugin-4/known-items" = ["ulauncher"];
      #"plugins/plugin-4/known-legacy-items" = ["thunar" "ulauncher" "xfce4-power-manager" "networkmanager applet" "pamac-tray"];
			"plugins/plugin-4/menu-is-primary" = true;
			"plugins/plugin-4/single-row" = true;
			"plugins/plugin-4/square-icons" = true;
			"plugins/plugin-4/symbolic-icons" = true;

			"plugins/plugin-5" = "pulseaudio";
			"plugins/plugin-5/enable-keyboard-shorcuts" = true;

			"plugins/plugin-6" = "power-manager-plugin";

			"plugins/plugin-7" = "clock";
			"plugins/plugin-7/digital-format" = "%I:%M %p";
			"plugins/plugin-7/mode" = 2;
			"plugins/plugin-7/show-seconds" = false;
			
			"plugins/plugin-8" = "notification-plugin";
    };
    xfwm4 = {
      "general/theme" = "Qogir-Dark";
      "general/title_font" = "Roboto Bold 11";
      "general/title_alignment" = "center";
      "general/use_compositing" = false;
      "general/raise_with_any_button" = false;
    };
    xsettings = {
      "Gtk/FontName" = "Roboto 10";
      "Gtk/MonospaceFontName" = "MesloLGS NF 10";

    };
  };

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
}
