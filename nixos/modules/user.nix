{ pkgs, ... }: {
	users = {
		users.ralf2oo2 = {
    			isNormalUser = true;
			description = "Ralf2oo2";
    			extraGroups = [ "wheel" "input" "networkmanager" ]; 
			packages = with pkgs; [];
		};
	};
}
