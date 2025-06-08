{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      package.path = "/home/tomas/dotfiles/neovim/lua/?.lua;" ..
        package.path
      require("init")
    '';
  };
}
