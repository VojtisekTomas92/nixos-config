{ config, pkgs, ... }: {

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git-pgtk;
    extraPackages = epkgs: [
    epkgs.orderless
];
};

  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacs-git-pgtk;
  };

  xdg.configFile."emacs" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/app-data/emacs";
  };
}
