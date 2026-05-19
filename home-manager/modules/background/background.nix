{pkgs, ...}:
let
  morning = ./morning.jpg;
  noon = ./noon.jpg;
  night = ./night.jpg;
in
{
  systemd.user.services.time-based-wallpaper = {
    description = "Change cinnamon wallpaper based on time of day";
    after = ["graphical-session.target"];

    serviceConfig = {
      Type = "oneshot";
      PassEnvironment = [ "DBUS_SESSION_BUS_ADDRESS" "DISPLAY" "XAUTHORITY" ];
    };

    script = ''
      HOUR=$(date +%H)
      HOUR=$((10#$HOUR))

      if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 12 ]; then
        WALLPAPER="${morning}"
      elif [ "$HOUR" -ge 12 ] && [ "$HOUR" -lt 18 ]; then
        WALLPAPER="${noon}"
      else
        WALLPAPER="${night}"
      fi

      ${pkgs.glib}/bin/gsettings set org.cinnamon.desktop.background picture-uri "file://$WALLPAPER"
      ${pkgs.glib}/bin/gsettings set org.cinnamon.desktop.background picture-uri-dark "file://$WALLPAPER"
    '';
  };

  systemd.user.timers.time-based-wallpaper = {
    description = "Timer to trigger cinnamon wallpaper changes hourly";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* *:00:00"; 
      OnStartupSec = "2m";
      Persistent = true;
    };
  };
}
