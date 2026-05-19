{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "wayland-push-to-talk";
  version = "1.0";

  src = ./.;

  buildInputs = [
    pkgs.libevdev
    pkgs.xdotool
    pkgs.pkg-config
    pkgs.libX11
  ];

  nativeBuildInputs = [ pkgs.makeWrapper ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 push-to-talk $out/bin/
  '';

  meta = with pkgs.lib; {
    description = "This fixes the inability to use push to talk in Discord when running Wayland ";
    homepage = "https://github.com/Rush/wayland-push-to-talk-fix"; # or your repo URL
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}