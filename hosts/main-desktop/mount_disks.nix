{
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/49ca17c9-4239-4551-a22f-f93db59252b4";
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
