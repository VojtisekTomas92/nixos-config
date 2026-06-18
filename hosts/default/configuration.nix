{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  services.flatpak.enable = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  services.printing.enable = true;

  programs.zsh.enable = true;

  users.users.tomas = {
    isNormalUser = true;
    description = "tomas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.11";

}
