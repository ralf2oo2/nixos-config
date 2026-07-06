{pkgs, ...}:
{
  imports = [
   	../../../nixos-modules/bootloader-sadaharu.nix
	../../../nixos-modules/user.nix
	../../../nixos-modules/sound.nix
	../../../nixos-modules/bluetooth.nix
	../../../nixos-modules/git.nix
	../../../nixos-modules/cinnamon.nix
	../../../nixos-modules/steam.nix
	../../../nixos-modules/java.nix
	../../../nixos-modules/appimage.nix
	../../../nixos-modules/wine.nix
	../../../nixos-modules/discord.nix
	../../../nixos-modules/nvidia-sadaharu.nix
	../../../nixos-modules/background/background.nix
  ];
}