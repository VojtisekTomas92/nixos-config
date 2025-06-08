{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "true";
    matchBlocks = {
      melonic = {
        hostname = "admin.r00t.li";
        user = "suswombat";
        identityFile = "/home/tomas/Syncthing/.ssh/id_rsa";
      };
    };
  };

  services.ssh-agent.enable = true;
}
