{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.hasklug

  ];

  fonts.fontconfig.enable = true;

  programs.konsole = {
    enable = true;

    defaultProfile = "tomas";
    profiles = {
      "tomas" = {
        name = "tomas";
        command = "${pkgs.zsh}/bin/zsh";

        font = {
          name = "Hasklug Nerd Font";
          size = 12;
        };
      };
    };

  };

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
