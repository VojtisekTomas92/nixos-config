{ ... }: {
  programs.btop = {
    enable = true;

    settings = {
      truecolor = true;
      theme_background = true;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      temp_scale = "celsius";
      background_update = true;
      show_battery = true;
      selected_battery = "Auto";
    };
  };
}
