{ lib, config, ... }: {
  options = {
    swapfile.enable = lib.mkEnableOption "enables swap file";
  };

  config = lib.mkMerge [
    {
      zramSwap.enable = true;
      zramSwap.memoryPercent = 100;
      zramSwap.priority = 100;

      boot.kernel.sysctl = {
        "vm.swappiness" = 120;
        "vm.vfs_cache_pressure" = 50;
      };
    }
    (lib.mkIf config.swapfile.enable {
      swapDevices = [ 
        { 
          device = "/swapfile";
          priority = 10;
        }
      ];
    })
  ];
}
