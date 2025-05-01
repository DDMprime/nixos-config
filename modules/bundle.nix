{
  imports = [
    ./common/packages.nix
    ./enivroinments/hyprland.nix
    ./enivroinments/zsh.nix
    ./hardware/amd-gpu.nix
    ./hardware/nvidia-gpu.nix
    ./services/autorun_input_remapper.nix
    ./services/pipewire.nix
    ./services/steam.nix
    ./services/vpn.nix
    ./services/zapret.nix
  ];

}
