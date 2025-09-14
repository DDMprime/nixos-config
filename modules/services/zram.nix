{
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;
  zramSwap.priority = 100;

swapDevices = [
    { device = "/swapfile"; priority = 10; }
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 120;
    "vm.vfs_cache_pressure" = 50;
  };
}
