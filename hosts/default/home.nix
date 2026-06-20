{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ../../modules/home

  ];

  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/dotfiles";
    NH_HOME_FLAKE = "${config.home.homeDirectory}/dotfiles";
  };

  home.packages = with pkgs; [
    git
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "Tomas";
      user.email = "vojtisektomas92@gmail.com";
    };
  };

  programs.emacs = {
    enable = true;
  };

  services.emacs = {
    enable = true;
    client.enable = true;
  };

  xdg.configFile."emacs" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/app-data/emacs";
  };

  programs.nix-index-database = {
    comma = {
      enable = true;
    };
  };

  home.stateVersion = "25.11";
}
