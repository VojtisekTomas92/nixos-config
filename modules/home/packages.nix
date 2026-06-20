{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    codegrab
    wl-clipboard
    goxel
    wine-staging
    keepassxc
    mumble
    python3
    kdotool
    ydotool
    exercism
    jre
    kdePackages.kate
    wget
    curl
    gimp
    easyeffects
    aseprite

    # Fonts
    nerd-fonts.hasklug
  ];

  services.flatpak = {
    enable = true;

    packages = [
      "com.usebottles.bottles"
      "org.vinegarhq.Sober"
      "io.github.MakovWait.Godots"
    ];
  };
}
