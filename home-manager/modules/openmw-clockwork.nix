{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "openmw-clockwork";
  version = "clockwork-alpha";

  src = pkgs.fetchFromGitLab {
    owner = "OursCodeur";
    repo = "openmw";
    rev = "clockwork-alpha";
    fetchSubmodules = true;
    hash = pkgs.lib.fakeHash;
  };

  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    git
    python3
    qt6.wrapQtAppsHook
  ];

  buildInputs = with pkgs; [
    boost
    ffmpeg
    icu
    lz4
    mygui
    openal
    qt6.qtbase
    qt6.qtsvg
    qt6.qttools
    sdl2_compat
    sqlite
    unshield
    yaml-cpp
    zlib
    collada-dom
    freetype
    libjpeg
    libpng
    libglvnd
    xorg.libXt
    vulkan-loader
  ];

  cmakeFlags = [
    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    "-DOPENMW_USE_SYSTEM_BULLET=OFF"
    "-DOPENMW_USE_SYSTEM_OSG=OFF"
    "-DOSG_STATIC=ON"
    "-DOPENMW_USE_VULKAN=ON"
    "-DOPENMW_USE_SYSTEM_GLSLANG=OFF"
    "-DOPENMW_USE_SYSTEM_VULKAN_HEADERS=OFF"
    "-DOPENMW_USE_SYSTEM_VMA=OFF"
    "-DBUILD_OPENCS=OFF"
  ];

  meta = with pkgs.lib; {
    description = "Custom OpenMW build configuration from OursCodeur/openmw clockwork-alpha";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}