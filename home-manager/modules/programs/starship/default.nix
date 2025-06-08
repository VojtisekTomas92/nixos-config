{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
      };
    };

  };
}
