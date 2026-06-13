{ config, pkgs, ... }: {

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  programs.firefox = {
    enable = true;

    package = pkgs.firefox;

    configPath = "${config.xdg.configHome}/mozilla/firefox";

    nativeMessagingHosts = [ pkgs.kdePackages.plasma-browser-integration ];
    profiles = {
      tomas = {

        isDefault = true;
        id = 0;

        settings = {
          "privacy.donottrackheader.enabled" = true;

        };

      };
    };

    policies = {

      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";

      Preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };

  };
}
