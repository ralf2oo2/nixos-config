{pkgs-stable, ...}:{
  environment.systemPackages = [ 
    (pkgs-stable.discord.override {
      withOpenASAR=true;
      withVencord=true;
    })
  ];
}