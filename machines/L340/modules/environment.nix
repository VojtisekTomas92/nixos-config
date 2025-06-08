{
  environment.variables = {
    KWIN_FORCE_SW_CURSOR = 1;
  };

  # Apparantly i need this "Enable zsh completion.
  # Don't forget to add environment.pathsToLink = [ "/share/zsh" ]; to your system configuration to get completion for system packages (e.g. systemd."
  environment.pathsToLink = [ "/share/zsh" ];

}
