inputs: let
  myLib = (import ./default.nix) {inherit inputs;};
  outputs = inputs.self.outputs;
  nixpkgs = inputs.nixpkgs;
  system = inputs.system;
  nixpkgs-stable = inputs.nixpkgs-stable;
in rec {

# yoinked from https://github.com/vimjoyer/nixconf/blob/main/myLib/default.nix

  myOverlays = import ./../overlays {inherit inputs outputs;};

  pkgsFor = system:
    import nixpkgs {
      inherit system;
      overlays = myOverlays;
    };

  overlayModule = {
    nixpkgs.overlays = myOverlays;
  };

  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs outputs myLib;
      };
      modules = [
        config
        outputs.nixosModules.default
        overlayModule

        ({pkgs, ...}: {nix.package = pkgs.lix;})
      ];
    };

  mkHome = config:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      extraSpecialArgs = {
        inherit inputs myLib outputs;
      };
      modules = [
        config
      ];
    };
}