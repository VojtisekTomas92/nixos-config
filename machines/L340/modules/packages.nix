{pkgs, ...}: {
  services.flatpak = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flatpak
    git
    nvidia-vaapi-driver
    (vivaldi.overrideAttrs
      (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
      }))
    xdotool
  ];

  programs.steam = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
  };

  programs.zsh.enable = true;
}
