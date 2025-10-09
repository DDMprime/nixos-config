{ config, lib, pkgs,  ... }:
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

        package = config.boot.kernelPackages.nvidiaPackages.latest;

#         package =config.boot.kernelPackages.nvidiaPackages.mkDriver {
#           version = "575.64.05";
#           sha256_64bit = "sha256-hfK1D5EiYcGRegss9+H5dDr/0Aj9wPIJ9NVWP3dNUC0=";
#           sha256_aarch64 = "sha256-GRE9VEEosbY7TL4HPFoyo0Ac5jgBHsZg9sBKJ4BLhsA=";
#           openSha256 = "sha256-mcbMVEyRxNyRrohgwWNylu45vIqF+flKHnmt47R//KU=";
#           settingsSha256 = "sha256-o2zUnYFUQjHOcCrB0w/4L6xI1hVUXLAWgG2Y26BowBE=";
#           persistencedSha256 = "sha256-2g5z7Pu8u2EiAh5givP5Q1Y4zk4Cbb06W37rf768NFU=";
#         };

        forceFullCompositionPipeline = true;
        nvidiaSettings = true; # Панель управления NVIDIA

      };
    };
  };
}
