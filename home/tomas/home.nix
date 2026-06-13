{ config, pkgs, ... }:

{

  imports = [
    ./packages.nix
    ./modules/vscode.nix
    ./modules/syncthing.nix
    ./modules/obsidian.nix
    ./modules/nixcord.nix

  ];

  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

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

  home.stateVersion = "25.11";
}
