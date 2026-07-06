{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [ jdk17 jdk21 ];
    etc = with pkgs; {
      "jdk17".source = jdk17;
      "jdk21".source = jdk21;
    };
  };
}