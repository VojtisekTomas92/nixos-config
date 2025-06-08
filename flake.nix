{
  description = "My try at a NixOs config :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      plasma-manager,
      nix-vscode-extensions,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        L340 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [

            # System
            ./machines/L340/configuration.nix
            ./machines/L340/modules/audio.nix
            ./machines/L340/modules/environment.nix
            ./machines/L340/modules/graphics.nix
            ./machines/L340/modules/hardware-configuration.nix
            ./machines/L340/modules/nix.nix
            ./machines/L340/modules/packages.nix
            home-manager.nixosModules.home-manager

            # User
            {
              nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "BACKUP";
              home-manager.users.tomas = {
                imports = [
                  nix-flatpak.homeManagerModules.nix-flatpak
                  plasma-manager.homeManagerModules.plasma-manager
                  ./users/tomas/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
