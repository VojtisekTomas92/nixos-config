#!/usr/bin/env bash
WURM_DIR="$HOME/.local/share/Steam/steamapps/common/Wurm Unlimited/WurmLauncher"

export GDK_BACKEND="x11"
export __NV_PRIME_RENDER_OFFLOAD="1"
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER="NVIDIA-G0"
export __GLX_VENDOR_LIBRARY_NAME="nvidia"
export __VK_LAYER_NV_optimus="NVIDIA_only"

cd "$WURM_DIR" || { echo "Directory $WURM_DIR not found!"; exit 1; }

nix-shell -E '
  with import <nixpkgs> {};
  mkShell {
    buildInputs = [ 
      jdk8 libGL libglvnd libxxf86vm libxcursor libxrandr 
      libX11 libXext libXrender libXtst libXi fontconfig freetype glib gtk2 zlib 
    ];
    NIX_GRAPHICS_LIBS = lib.makeLibraryPath [
      libGL libglvnd libxxf86vm libxcursor libxrandr 
      libX11 libXext libXrender libXtst libXi fontconfig freetype glib gtk2 zlib
    ];
  }
' --run '
  export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib:$WURM_DIR/nativelibs:$WURM_DIR:$NIX_GRAPHICS_LIBS:$LD_LIBRARY_PATH"
  
  java -Djava.library.path=nativelibs \
       -cp "client.jar:common.jar:lib/*:../runtime/jre1.8.0_172/lib/ext/*:../runtime/jre1.8.0_172/lib/*" \
       com.wurmonline.client.launcherfx.WurmMain
'