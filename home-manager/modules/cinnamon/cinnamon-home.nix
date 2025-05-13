{ config, pkgs, lib, ... }:
{

  imports = [
    ./dconf.nix
  ];

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
}
