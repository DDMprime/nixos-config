{
  user = "homelab";
  system = "x86_64-linux";
  PathToPackages = ../../modules/common/homelab;

  ConfigFile = {
    hyprland.enable = false;
    tty.enable = true;
    niri.enable = false;
    zapret.enable = true;
    zsh.enable = true;
    nvidia.enable = true;
    input_remapper.enable = false;
    zerotier.enable = false;
    tailscale.enable = false;
    ssh.enable = true;
    i2p.enable = false;
    samba.enable = false;
    steam.enable = false;
    swapfile.enable = false;
  };

}
