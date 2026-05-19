{inputs, system, pkgs, }:
let
  inherit (inputs) nixpkgs nixpkgs-stable home-manager;
in{

# yoinked from https://github.com/vimjoyer/nixconf/blob/main/myLib/default.nix

  mkSystem = entrypoint:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system pkgs;
      };
      modules = [
        entrypoint
      ];
    };

  mkHome = config:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      modules = [
        config
      ];
    };
}