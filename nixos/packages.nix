{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
	};
	environment.systemPackages = with pkgs; [
    firefox
    discord
    steam

    vlc
    qbittorrent

    git
    lazygit
    vim
    neofetch

    nh
    nix-output-monitor
    nvd

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
		(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
	];
}
