{
  imports = [
    #Common
    ./common/CLI.nix
    ./common/CodingStuff.nix
    ./common/DesktopApps.nix
    ./common/Fonts.nix
    ./common/GPUnvidia.nix
    ./common/Hyprland.nix
    ./common/NetworkManagment.nix
    ./common/Niri.nix
    ./common/Other.nix
    ./common/Sound.nix
    ./common/Steam.nix

    #Environments
    ./enivronments/hyprland.nix
    ./enivronments/niri.nix
    ./enivronments/zsh.nix
    ./enivronments/neovim.nix
    ./enivronments/spicetify.nix
    ./enivronments/hyprland_plug.nix

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
