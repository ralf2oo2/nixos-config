{

  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-stable-2411.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    tidal-overlay.url = "github:mitchmindtree/tidalcycles.nix";

    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks.url = "github:cachix/git-hooks.nix";

    sdl_shadercross.url = "path:./flakes/shadercross/";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      spicetify-nix,
      git-hooks,
      quickshell,
      nixpkgs-stable-2411,
      tidal-overlay,
      sdl_shadercross,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      inherit system;
        overlays = [
          tidal-overlay.overlays.default
        ];
        config = {
          allowUnfree = true;
        };
      };
      mylib = import ./lib/default.nix {
        inherit inputs system pkgs;
      };
    in
    {
      devShells.${system}.tidal = tidal-overlay.devShells.${system}.tidal;
      nixosConfigurations = {
        bebop = mylib.mkSystem ./hosts/nixos/bebop/configuration.nix;
      };
      homeConfigurations.ralf2oo2 = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = { 
          inherit inputs; 
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
      };

      #doesn't seem to do anything
      # devShells.${system}.default =
      #   let
      #     pre-commit-check = git-hooks.run {
      #       hooks = {
      #         nixfmt-rfc-style.enable = true;
      #       };
      #     };

      #   in
      #   nixpkgs.mkShellNoCC {
      #     packages = [ pre-commit-check.enabledPackages ];
      #     shellHook = pre-commit-check.shellHook;
      #   };

    };

}
