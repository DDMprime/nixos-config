{ lib, config,  ... }:

{
  options = {
    niri.enable =
      lib.mkEnableOption "enables niri";
  };


  config = lib.mkIf config.niri.enable {

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
    };

    programs.niri.enable = true; # Включение niri
  };
}
