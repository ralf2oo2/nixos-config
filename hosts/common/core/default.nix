{ pkgs, ... }: {
	nix.settings.experimental-features = ["nix-command" "flakes"];

	networking.hostName = "nixos"; # Define your hostname.
	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

	time.timeZone = "Europe/Amsterdam";

	i18n.defaultLocale = "en_US.UTF-8";

	system.stateVersion = "23.11"; # Did you read the comment?
}