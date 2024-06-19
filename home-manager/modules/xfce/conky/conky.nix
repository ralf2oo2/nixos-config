{ pkgs, ... } : {
	home.packages = with pkgs; [
    conky
  	];
}