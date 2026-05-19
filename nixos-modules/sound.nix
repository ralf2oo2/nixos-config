{pkgs, ...}:{

  environment.systemPackages = [
    pkgs.pipewire.jack
  ];

  services.pulseaudio.enable = false;

  #rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    wireplumber = {
      configPackages = [
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf" ''
          wireplumber.settings = { bluetooth.autoswitch-to-headset-profile = false }
        '')
      ];
    };

    # If you want to use JACK  applications, uncomment this
    #jack.enable = true;
  };
}
