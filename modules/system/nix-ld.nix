{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glib
      libxcb
      libxcb-util
      libxcb-wm
      libxcb-image
      libxcb-keysyms
      libxcb-render-util
      libxcb-cursor
      libxcb-errors
      libxkbcommon
      pcre2

      dbus
      wayland

      numactl
      libpulseaudio
      libva
      libvdpau
      libxfixes

      libX11
      libXext
      libXrender
      libXtst
      libXi
      libXxf86vm

      libGL
      libGLU
      libglvnd

      # Audio & System
      alsa-lib
      libjack2
      fontconfig
      freetype
    ];
  };
}
