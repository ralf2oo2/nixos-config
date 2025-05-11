{

	description = "My system configuration";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
		};
	};

	outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs: 
		let
			system = "x86_64-linux";
		in{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {
				pkgs-stable = import nixpkgs-stable {
					inherit system;
					config.allowUnfree = true;	
				};
				inherit inputs system;
			};
			
			modules = [ 
				./nixos/configuration.nix
				inputs.nixvim.nixosModules.nixvim
			];
		};

		homeConfigurations.ralf2oo2 = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home-manager/home.nix ];
		};
	};

}
