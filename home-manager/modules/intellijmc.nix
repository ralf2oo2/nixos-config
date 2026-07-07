{pkgs ? import <nixpkgs> {}} :
let idea-env = pkgs.buildFHSEnv {
    name = "idea-env";
    targetPkgs = pkgs: (with pkgs; [
      libxext
      fontconfig
      libx11
      openal
      glfw2
      libpulseaudio
      libxxf86vm
      libice
      libsm
      libxrender
      libxtst
      libxi
      libxcursor
      libxrandr
      libGL
      jdk17
    ]);

    profile = ''
      export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.libGL ]}:$LD_LIBRARY_PATH"

      export JAVA_HOME="${pkgs.jdk17}"
    '';
    
    runScript = "idea-oss"; 
  };
in
pkgs.symlinkJoin {
  name = "intellij-minecraft";
  paths = [idea-env];
  postBuild = ''
    mkdir -p $out/share/applications
    cp ${pkgs.makeDesktopItem {
      name = "intellij-minecraft";
      desktopName = "IntelliJ IDEA (Minecraft FHS)";
      exec = "${idea-env}/bin/idea-env %f";
      icon = "idea-oss";
      categories = [ "Development" ];
    }}/share/applications/* $out/share/applications/
  '';
}