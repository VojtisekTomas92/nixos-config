{
  nix.settings = {
    http-connections = 0;
    max-jobs = "auto";
    cores = 0;
    show-trace = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
