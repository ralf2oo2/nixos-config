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

    lazygit
    vim
    neofetch
    git-credential-oauth

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
		pkgs.nerd-fonts.symbols-only
	];
}
