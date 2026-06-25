{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nh
    sops
    age
  ];
}
