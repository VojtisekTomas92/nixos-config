{ pkgs, ... }:
{
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [
    ../../home-manager/modules/programs
    ../../home-manager/modules/packages.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
