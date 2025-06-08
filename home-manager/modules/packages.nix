{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # No category yet
    lazygit
    audacity
    protonup-qt
    obsidian
    papirus-icon-theme
    kdePackages.kate
    pciutils
    # Communication
    discord
    mumble
    # Dev Stuff
    ## Language package managers
    luarocks
    # System utils
    tlrc
    curl
    # Neovim seems to want it
    fd
    ripgrep
    # Fonts
    nerd-fonts.fira-code
    bemenu
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "com.github.tchx84.Flatseal"
      "org.vinegarhq.Sober"
    ];
  };

  services.easyeffects = {
    enable = true;
  };

  # Enable and configure Git
  programs.git = {
    enable = true;
    userName = "VojtisekTomas92";
    userEmail = "vojtisektomas92@gmail.com";
  };

  programs.nh = {
    enable = true;
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };
}
