{
  imports = [
    ./common/packages.nix
    ./enivroinments/hyprland.nix
    ./enivroinments/zsh.nix
    ./hardware/nvidia-gpu.nix
    ./services/autorun_input_remapper.nix
    ./services/pipewire.nix
    ./services/steam.nix
    ./services/zerotier.nix
    ./services/tailscale.nix
    ./services/zapret.nix
  ];

}
