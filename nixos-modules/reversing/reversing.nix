{pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    ghidra-bin
    scanmem
  ];
}