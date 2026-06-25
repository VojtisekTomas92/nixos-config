{ ... }: {
  imports = [
    ./btop.nix
    ./firefox.nix
    ./nixcord.nix
    ./obsidian.nix
    ./packages.nix
    ./plasma.nix
    ./syncthing.nix
    ./vscode.nix
    ./shell.nix
    ./ghostty.nix
    ./containers/podman.nix
  ];
}
