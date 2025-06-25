{ inputs, ... }:
let
  pkgs2411 = inputs.nixpkgs-stable-2411.legacyPackages.x86_64-linux;
in {
  environment.systemPackages = [
    pkgs2411.pinta
  ];
}