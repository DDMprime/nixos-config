{ lib, config, pkgs,  ... }:

{
  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };


  config = lib.mkIf config.hyprland.enable {

    services.xserver.enable = true;
    # Enable the Hyprland Desktop Environment
    services.udisks2.enable = true;
    services.dbus.enable = true;
    services.gvfs.enable = true;

    services.displayManager = {
      sddm.enable = false;
      autoLogin = {
        enable = true;
        user = "ddm";
      };
    };

    environment.sessionVariables = {
      LIBGL_DRIVERS_PATH = "${pkgs.mesa}/lib/dri";
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      __GLX_ALLOW_NV20_SUBPIXEL = "1";
      GDK_BACKEND = "wayland,x11";

      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      WLR_NO_HARDWARE_CURSORS = "1"; # Решает проблемы с курсором
      NIXOS_OZONE_WL = "1"; # Для Wayland-совместимых приложений
      JAVA_TOOL_OPTIONS = "-Dorg.lwjgl.glfw.libname=${pkgs.glfw3}/lib/libglfw.so -Dorg.lwjgl.openal.libname=${pkgs.openal}/lib/libopenal.so"; # Для маинкрафта
      TERM = "kitty";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Для X11-приложений
    };
  };
}
