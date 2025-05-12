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

    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      spicetify-nix,
      git-hooks,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
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
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };

      devShells.${system}.default =
        let
          pre-commit-check = git-hooks.run {
            hooks = {
              nixfmt-rfc-style.enable = true;
            };
          };

        in
        nixpkgs.mkShellNoCC {
          packages = [ pre-commit-check.enabledPackages ];
          shellHook = pre-commit-check.shellHook;
        };

    };

}
