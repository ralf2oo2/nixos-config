{

	description = "Ralf2oo2's Nix config. based on EmergentMind's Nix Config";

	outputs = 
	{ 
		nixpkgs,
		nixpkgs-stable,
		home-manager,
		... 
	}@inputs: 
		let
			inherit (self) outputs;
			
			
			#
			# ========= Architectures =========
			#
			forAllSystems = nixpkgs.lib.genAttrs [
				"x86_64-linux"
			];
			
			# ========== Extend lib with lib.custom ==========
			# NOTE: This approach allows lib.custom to propagate into hm
			# see: https://github.com/nix-community/home-manager/pull/3454
			lib = nixpkgs.lib.extend (self: super: { custom = import ./lib { inherit (nixpkgs) lib; }; });
		
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
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

}
