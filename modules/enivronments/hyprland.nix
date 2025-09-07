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
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      WLR_NO_HARDWARE_CURSORS = "1"; # Решает проблемы с курсором
      NIXOS_OZONE_WL = "1"; # Для Wayland-совместимых приложений
      JAVA_TOOL_OPTIONS = "-Dorg.lwjgl.glfw.libname=${pkgs.glfw3}/lib/libglfw.so -Dorg.lwjgl.openal.libname=${pkgs.openal}/lib/libopenal.so"; # Для маинкрафта
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Для X11-приложений
    };
  };
}
