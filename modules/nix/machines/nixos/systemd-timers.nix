{ pkgs, ... }:
{
  systemd.timers."ddns" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "30s";
      OnUnitActiveSec = "30s";
      Unit = "hello-world.service";
    };
  };

  systemd.services."hello-world" = {
    script = ''
      set -eu
      ${pkgs.coreutils}/bin/echo "Hello World, i'm $(whoami)"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "zspekt";
    };
  };
}
