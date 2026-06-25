{ inputs, config, ... }: {
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };
}
