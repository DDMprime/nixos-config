{
  imports = [
    #Common
    ./common/user_packages.nix
    ./common/steam.nix
    ./common/fonts.nix

    #Environments
    ./enivronments/hyprland.nix
    ./enivronments/niri.nix
    ./enivronments/zsh.nix
    ./enivronments/neovim.nix
    ./enivronments/spicetify.nix
    ./enivronments/hyprland_plug.nix
    ./enivronments/tty.nix

    #Hardware
    ./hardware/nvidia-gpu.nix

    # Services
    ./services/autorun_input_remapper.nix
    ./services/pipewire.nix
    ./services/zerotier.nix
    ./services/tailscale.nix
    ./services/zapret.nix
    ./services/remote_access.nix
    ./services/i2p.nix
    ./services/shared.nix
    ./services/zram.nix
  ];

}
