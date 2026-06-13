{ pkgs, ... }: {
  programs.nixcord = {
    enable = true;

    discord.vencord.enable = false;
    discord.equicord.enable = true;

    discord.package = pkgs.discord.overrideAttrs (oldAttrs: {
      passthru = (oldAttrs.passthru or { }) // {
        override =
          args:
          pkgs.symlinkJoin {
            name = "discord-nvidia-offload";
            paths = [ pkgs.discord ];
            nativeBuildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/discord \
                --set __NV_PRIME_RENDER_OFFLOAD "1" \
                --set __NV_PRIME_RENDER_OFFLOAD_PROVIDER "NVIDIA-G0" \
                --set __GLX_VENDOR_LIBRARY_NAME "nvidia" \
                --set __VK_LAYER_NV_optimus "NVIDIA_only"
            '';
          };
      };
    });

  };
}
