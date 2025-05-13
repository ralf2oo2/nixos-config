{ config, pkgs, lib, ... }:
{

  imports = [
    ./dconf.nix
    ./gtk.nix
    ./nemoactions/nemoactions.nix
  ];

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
}
