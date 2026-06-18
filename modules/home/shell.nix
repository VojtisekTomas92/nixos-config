{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    bat
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableVteIntegration = pkgs.stdenv.isLinux;
    autocd = true;
    autosuggestion.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 30000;
      share = true;
    };

    initContent = ''
      source "${config.home.homeDirectory}/dotfiles/app-data/.zshrc"
    '';
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

  };
}
