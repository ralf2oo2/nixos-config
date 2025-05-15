{pkgs, ...}: {
  systemPackages = with pkgs; [ jdk17 ];
  etc = with pkgs; {
    "jdk17".source = jdk17;
  };
}