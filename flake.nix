{

  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-stable-2411.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixpkgs-stable-2411,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      mylib = import ./lib/default.nix {
        inherit inputs system;
      };
    in
    {
      nixosConfigurations = {
        bebop = mylib.mkSystem ./hosts/nixos/bebop/configuration.nix;
      };
      homeConfigurations.ralf2oo2 = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };

      #doesn't seem to do anything
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
