{ lib, config, pkgs, inputs,  ... }:

{
  #imports = [ inputs.niri.nixosModules.niri ];
  options = {
    niri.enable =
      lib.mkEnableOption "enables niri";
  };


  config = lib.mkIf config.niri.enable {

    services = {
      xserver.enable = true;
      udisks2.enable = true;
      dbus = {
        packages = [ pkgs.nautilus ];
        enable = true;
      };
      gvfs.enable = true;
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.niri}/bin/niri";
          user = "ddm";
        };
        default_session = initial_session;
      };
    };

    environment.sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      WLR_NO_HARDWARE_CURSORS = "1"; # Решает проблемы с курсором
      NIXOS_OZONE_WL = "1"; # Для Wayland-совместимых приложений

      LIBGL_DRIVERS_PATH = "${pkgs.mesa}/lib/dri";
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      EGL_PLATFORM = "wayland";
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      __GLX_ALLOW_NV20_SUBPIXEL = "1";
      GDK_BACKEND = "wayland,x11";
      JAVA_TOOL_OPTIONS = "-Dorg.lwjgl.glfw.libname=${pkgs.glfw3}/lib/libglfw.so -Dorg.lwjgl.openal.libname=${pkgs.openal}/lib/libopenal.so"; # Для маинкрафта
      TERM = "kitty";
    };

    nixpkgs.overlays = [ inputs.niri.overlays.niri
      (self: super: {
        niri-unstable = super.niri-unstable.overrideAttrs (old: {
          doCheck = false;
        });
      })
     ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

  };
}
