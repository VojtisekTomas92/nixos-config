{
  programs.bat = {
    enable = true;
    config = {
      theme = "OneHalfDark";
    };

  };

  programs.zsh.shellAliases = {
    cat = "bat";
  };
}
