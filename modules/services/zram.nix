{
  zramSwap.enable = true; # сжатие памяти
  zramSwap.memoryPercent = 100;
  zramSwap.priority = 100;

swapDevices = [
    { device = "/swapfile"; priority = 10; } # раздел подкачки, приоритет 10 - только в крайних случаяъ
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 120;
    "vm.vfs_cache_pressure" = 50;
  };
}
