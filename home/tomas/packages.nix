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
  ];

  services.flatpak = {
    enable = true;

    packages = [
      "com.usebottles.bottles"
      "org.vinegarhq.Sober"
    ];
  };
}
