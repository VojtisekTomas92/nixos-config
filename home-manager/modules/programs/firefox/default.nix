{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in
        listToAttrs [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
          (extension "dearrow" "deArrow@ajay.app")
          (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
        ];
    };
  };
}
