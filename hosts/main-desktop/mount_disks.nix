{
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/5bc4944b-2565-4ddf-b652-65724ad698f7";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.device-timeout=1s"
    ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/F41A8A5F1A8A1EAC";
    fsType = "ntfs";
    options = [
      "nofail"
      "x-systemd.device-timeout=1s"
    ];
  };
}
