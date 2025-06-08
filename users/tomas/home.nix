{ pkgs, ... }:
{
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [
    ../../home-manager/modules/programs
    ../../home-manager/modules/packages.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    extraConfig = ''
      source = ~/dotfiles/hyprland/hyprland.conf
    '';
  };

  #neovim

  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      package.path = "/home/tomas/dotfiles/neovim/lua/?.lua;" ..
        package.path
      require("init")
    '';
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "OneDark-Pro";
    font = {
      name = "Fira Code";
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
