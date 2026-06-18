{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glib

      # Core X11 & Input
      libX11
      libXext
      libXrender
      libXtst
      libXi
      libXxf86vm

      # Hardware Graphics & OpenGL (Crucial for JavaFX)
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
