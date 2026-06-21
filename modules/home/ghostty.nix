{ ... }: {
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;
    installBatSyntax = true;

    settings = {
      theme = "Doom One";
    };
  };
}
