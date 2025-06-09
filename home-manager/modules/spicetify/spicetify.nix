{ inputs, pkgs, ... }: {
	imports = [
		inputs.spicetify-nix.homeManagerModules.default
	];

	programs.spicetify = 
	let
		spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
	in
	{
		enable = true;
		
		enabledExtensions = with spicePkgs.extensions; [
			adblock
			beautifulLyrics
			betterGenres
			shuffle
			volumePercentage
		];

		theme = spicePkgs.themes.comfy;
		colorScheme = "catppuccin-frappe";
	};
}