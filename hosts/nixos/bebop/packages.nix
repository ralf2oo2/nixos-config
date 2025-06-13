{ pkgs, inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    firefox
    discord

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
    nixd

    killall
    gparted
    home-manager

    xorg.libXxf86vm
    
    nodejs
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      nerd-fonts.symbols-only
      mplus-outline-fonts.osdnRelease # japanese font
      roboto
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Roboto 9"
          "M+ 1mn"
        ];
        sansSerif = [
          "Roboto 9"
          "M+ 1mn"
        ];
        monospace = [
          "Jetbrains Mono"
          "M+ 1c"
        ];
      };
    };

    fontDir.enable = true;
  };

  services.ratbagd.enable = true;
}
