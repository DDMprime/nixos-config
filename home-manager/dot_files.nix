{ config, lib, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland config";
    niri.enable = lib.mkEnableOption "Enable Niri config";
  };

  config = lib.mkMerge [
    #Other
    {
      home.file.".zshrc".text = "# Конфигурация управляется NixOS";

      home.file.".config/kate" = {
        source = ./dotfiles/kate;
        recursive = true;
      };

      home.file.".config/fzf_dirs.txt" = {
        source = ./dotfiles/fzf_dirs.txt;
        recursive = true;
      };
    }

    #Hyprland
    (lib.mkIf config.hyprland.enable {
      home.file.".config/hypr" = {
        source = ./dotfiles/hypr-nord;
        recursive = true;
      };

      home.file.".config/waybar" = {
        source = ./dotfiles/waybar-hypr-nord;
        recursive = true;
      };

      home.file.".config/wlogout" = {
        source = ./dotfiles/wlogout-nord;
        recursive = true;
      };

      home.file.".config/swaync" = {
        source = ./dotfiles/swaync-hypr-nord;
        recursive = true;
      };

      home.file.".config/rofi" = {
        source = ./dotfiles/rofi-hypr-nord;
        recursive = true;
      };

      home.file.".config/kitty" = {
        source = ./dotfiles/kitty-nord;
        recursive = true;
      };
      home.file.".config/btop" = {
        source = ./dotfiles/btop-nord;
        recursive = true;
      };

      home.file.".config/cava" = {
        source = ./dotfiles/cava-nord;
        recursive = true;
      };
    })

    #Niri
    (lib.mkIf config.niri.enable {
      home.file.".config/niri" = {
        source = ./dotfiles/niri;
        recursive = true;
      };

    })
  ];
}
