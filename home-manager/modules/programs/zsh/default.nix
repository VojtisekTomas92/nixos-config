{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      lla = "ls -la";
      nhs = "nh os switch /home/$USER/nixos-config/nixos#$HOSTNAME";
    };

    initContent = lib.mkOrder 1000 ''
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
  };
}
