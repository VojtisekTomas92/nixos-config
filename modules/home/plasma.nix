{ ... }: {
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    input = {
      keyboard = {
        numlockOnStartup = "on";
        layouts = [
          {
            layout = "de";
          }
        ];
      };
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Return";
      command = "konsole";
    };

    session = {
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };

    powerdevil = {
      AC = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 7200;
        };
        whenLaptopLidClosed = "shutDown";
        inhibitLidActionWhenExternalMonitorConnected = false;
      };
    };

  };
}
