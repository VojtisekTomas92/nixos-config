# Thanks to https://github.com/mmuffins
# https://github.com/NixOS/nixpkgs/issues/348454#issuecomment-2629114389
{
  pkgs,
  lib,
  ...
}:
{
  services.activitywatch = {
    enable = true;
    # extraOptions = [];
    # settings = {};
    watchers = {
      #  wayland compatible watcher, replaces aw-watcher-afk and aw-watcher-window
      aw-awatcher = {
        package = pkgs.awatcher;
        executable = "awatcher";
        settings = {
          idle-timeout-seconds = 180;
          poll-time-idle-seconds = 10;
          poll-time-window-seconds = 5;
        };
      };
    };
  };

  systemd.user.services.aw-awatcher = {
    Unit = {
      Description = "AWatcher";
      Requires = [ "activitywatch.service" ];
      After = [
        "activitywatch.service"
        "graphical-session.target"
      ];
    };
    Service = {
      ExecStart = lib.getExe pkgs.awatcher;
      Restart = "on-failure";
      Type = "simple";
      TimeoutStartSec = 120;
      ExecStartPre = "/run/current-system/sw/bin/sleep 5";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
