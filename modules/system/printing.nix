{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kdePackages.skanpage

  ];

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      hplipWithPlugin
      splix
    ];
  };

  users.users.tomas = {
    extraGroups = [
      "scanner"
      "lp"
    ];
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
