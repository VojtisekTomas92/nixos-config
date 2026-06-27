{
  config,
  pkgs,
  ...
}:
{

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableVteIntegration = pkgs.stdenv.isLinux;
    autocd = true;
    autosuggestion.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

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

      ZINIT_HOME="${config.home.homeDirectory}/.local/share/zinit/zinit.git"
      [ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
      [ ! -d "$ZINIT_HOME/.git" ] && ${pkgs.git}/bin/git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      source "$ZINIT_HOME/zinit.zsh"


      zinit load nix-community/nix-zsh-completions
      zinit load MichaelAquilina/zsh-you-should-use
      zinit load fdellwing/zsh-bat

      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

    '';
  };

  home.shellAliases = {
    cat = "bat";
  };

}
