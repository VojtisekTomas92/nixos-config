{ pkgs, ... }: {
  programs.nixcord = {
    enable = true;
    discord.equicord.enable = true;

    discord.package = pkgs.discord.override {
      extraEnv = {
        __NV_PRIME_RENDER_OFFLOAD = "1";
        __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        __VK_LAYER_NV_optimus = "NVIDIA_only";
      };
    };

  };
}
