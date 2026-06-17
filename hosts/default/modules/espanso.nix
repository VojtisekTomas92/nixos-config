{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kdotool
    ydotool
    wl-clipboard
  ];

  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;

  };

  systemd.tmpfiles.rules = [
    "L+     /home/tomas/.config/espanso/config  -      tomas   users   -     /home/tomas/dotfiles/espanso/config"
    "L+     /home/tomas/.config/espanso/match   -      tomas   users   -     /home/tomas/dotfiles/espanso/match"
  ];

  systemd.user.services.espanso.wantedBy = [ "graphical-session.target" ];
}
