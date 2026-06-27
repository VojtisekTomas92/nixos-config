{ ... }: {
  programs.fzf = {
    enable = true;

    enableZshIntegration = true;

    colors = {
      "bg+" = "#353b45"; # color01
      bg = "#282c34"; # color00
      fg = "#565c64"; # color04
      "fg+" = "#b6bdca"; # color06
      hl = "#61afef"; # color0D
      "hl+" = "#61afef"; # color0D
      info = "#e5c07b"; # color0A
      header = "#61afef"; # color0D
      pointer = "#56b6c2"; # color0C
      marker = "#56b6c2"; # color0C
      prompt = "#e5c07b"; # color0A
      spinner = "#56b6c2"; # color0C
    };
  };
}
