{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [ nvtopPackages.full ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = true;
      powerManagement.finegrained = true;

      open = false;
      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true; # Creates the 'nvidia-offload' utility shortcut
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
