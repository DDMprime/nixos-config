{
  imports = [
    ./common/packages.nix
    ./common/steam.nix
    ./enivroinments/hyprland.nix
    ./enivroinments/zsh.nix
    ./hardware/nvidia-gpu.nix
    ./services/autorun_input_remapper.nix
    ./services/pipewire.nix
    ./services/zerotier.nix
    ./services/tailscale.nix
    ./services/zapret.nix
  ];

}
