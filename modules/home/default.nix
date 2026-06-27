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
    ./ghostty.nix
    ./containers/podman.nix
    ./sops.nix
    ./terminal/zsh.nix
    ./terminal/kitty.nix
    ./terminal/eza.nix
  ];
}
