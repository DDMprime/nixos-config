{
  user = "ddm";
  system = "x86_64-linux";
  DesktopPackages = true;

  ConfigFile = {
    hyprland.enable = true;
    niri.enable = false;
    zapret.enable = true;
    zsh.enable = true;
    nvidia.enable = true;
    input_remapper.enable = true;
    zerotier.enable = true;
    tailscale.enable = false;
    ssh.enable = false;
    i2p.enable = true;
    samba.enable = false;
    steam.enable = true;
  };
}
