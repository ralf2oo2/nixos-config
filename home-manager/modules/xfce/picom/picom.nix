{ pkgs, ... } : {
	home.packages = with pkgs; [
    picom
  	];
	xdg.configFile."picom/picom.conf" = { source = ./picom.conf; };
	xdg.configFile."autostart/picom.desktop" = { source = ./picom.desktop; };
}