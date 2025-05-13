{ pkgs, ... }: {
  home.packages = with pkgs; [
    dconf
  ];
  dconf = {
    enable = true;
    settings = {

      "org/cinnamon/desktop/interface" = {
        cursor-theme = "OpenZone_Fire_Slim";
        gtk-theme = "Qogir-Dark";
        icon-theme = "Papirus-Dark";
      };
      "org/gnome/desktop/interface" = {
        cursor-theme = "OpenZone_Fire_Slim";
        gtk-theme = "Qogir-Dark";
        icon-theme = "Papirus-Dark";
      };
      "org/cinnamon/theme" = {
        name = "Qogir-Dark";
      };

      "org/cinnamon" = {
        enabled-applets = [
          "panel1:left:0:menu@cinnamon.org:0"
          "panel1:left:1:separator@cinnamon.org:1"
          "panel1:left:2:grouped-window-list@cinnamon.org:2"
          "panel1:right:0:systray@cinnamon.org:3"
          "panel1:right:1:xapp-status@cinnamon.org:4"
          "panel1:right:2:notifications@cinnamon.org:5"
          "panel1:right:3:printers@cinnamon.org:6"
          "panel1:right:4:removable-drives@cinnamon.org:7"
          "panel1:right:5:keyboard@cinnamon.org:8"
          "panel1:right:6:favorites@cinnamon.org:9"
          "panel1:right:7:network@cinnamon.org:10"
          "panel1:right:8:sound@cinnamon.org:11"
          "panel1:right:9:power@cinnamon.org:12"
          "panel1:right:11:cornerbar@cinnamon.org:14"
          "panel1:right:10:calendar@cinnamon.org:17"
          "panel2:left:0:grouped-window-list@cinnamon.org:15"
        ];

        panels-autohide = [
          "1:false"
          "2:false"
        ];
        
        panels-enabled = [
          "1:0:bottom"
          "2:1:bottom"
        ];

        panels-height = [
          "1:40"
          "2:40"
        ];

        panels-hide-delay = [
          "1:0"
          "2:0"
        ];

        panels-show-delay = [
          "1:0"
          "2:0"
        ];

        panel-zone-icon-sizes = ''
          [{'panelId':1, 'left':0, 'center':0, 'right':24}, {'left':0, 'center':0, 'right':0, 'panelId':2}]
        '';

        panel-zone-symbolic-icon-sizes = ''
          [{"panelId":1,"left":28,"center":28,"right":16},{"left":28,"center":28,"right":28,"panelId":2}]
        '';

        panel-zone-text-sizes = ''
          [{"panelId":1,"left":0,"center":0,"right":0},{"left":0,"center":0,"right":0,"panelId":2}]
        '';
      };
    };
  };
}