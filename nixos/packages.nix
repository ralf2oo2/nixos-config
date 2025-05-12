{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
	};
	environment.systemPackages = with pkgs; [
    firefox
    discord
    steam

    libratbag

    vlc
    qbittorrent

    lazygit
    vim
    neofetch
    git-credential-oauth

    nh
    nix-output-monitor
    nvd

		nixfmt-rfc-style

	killall
	gparted
	home-manager
	];

	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts
		noto-fonts-emoji
		twemoji-color-font
		font-awesome
		powerline-fonts
		powerline-symbols
		pkgs.nerd-fonts.symbols-only
	];

	services.ratbagd.enable = true;
}
