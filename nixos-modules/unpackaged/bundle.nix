{pkgs, ...}:
let
  pushToTalk = pkgs.callPackage ./pushtotalk/default.nix {};
in{
  environment.systemPackages = [ 
    pushToTalk
  ];
  systemd.user.services.push-to-talk = {
    description = "Discord Push-to-Talk Helper";
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pushToTalk}/bin/push-to-talk -v -k KEY_X -n X /dev/input/by-id/usb-SEMICO_USB_Keyboard-event-kbd";
      Restart = "on-failure";
    };
  };
}