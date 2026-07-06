{ pkgs, inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    firefox

    libratbag

    vlc
    qbittorrent

    lazygit
    vim
    fastfetch
    git-credential-oauth

    nh
    nix-output-monitor
    nvd

    quickemu

    nixfmt
    nixd

    killall
    gparted
    home-manager

    libxxf86vm

    nix-tree

    switcheroo-control
    
    nodejs
    openvpn
    zenity
    openal
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      nerd-fonts.symbols-only
      font-awesome
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
