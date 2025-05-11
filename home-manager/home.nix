{ inputs, ... }:{
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
}
