{ config, lib,  ... }:

{

  options = {
    nvidia.enable =
      lib.mkEnableOption "enables nvidia";
  };

  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true; # Для 32-битных приложений (Steam)
      };

      nvidia = {
        open = true;

        modesetting.enable = true; # Необходимо для Wayland
        powerManagement.enable = true; # Управление питанием

        package = config.boot.kernelPackages.nvidiaPackages.production; # production - стабильная версия 550
        forceFullCompositionPipeline = true;
        nvidiaSettings = true; # Панель управления NVIDIA
      };
    };
  };
}
