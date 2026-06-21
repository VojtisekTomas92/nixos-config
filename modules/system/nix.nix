{ ... }: {
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    trusted-users = [
      "root"
      "tomas"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];

  };
}
