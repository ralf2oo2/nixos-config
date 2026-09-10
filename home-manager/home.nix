{ inputs, ... }: {
	imports = [
		./modules/bundle.nix
	];
	home = {
		username = "ralf2oo2";
    homeDirectory = "/home/ralf2oo2";

		stateVersion = "24.11";
  };
  fonts = {
    fontconfig.enable = true;
  };

	xdg.enable = true;
	xdg.mime.enable = true;
	xdg.mimeApps = {
		enable = true;
		defaultApplications = {

			"x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];

			"application/zip" = ["org.gnome.FileRoller.desktop"];
			"application/vnd.rar" = ["org.gnome.FileRoller.desktop"];
			"text/plain" = ["org.kde.kwrite.desktop"];
			"image/png" = ["xviewer.desktop"];
			"image/jpeg" = ["xviewer.desktop"];
		};
	};
}
