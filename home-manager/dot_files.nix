{
  home.file.".zshrc".text = "# Конфигурация управляется NixOS";

  home.file.".config/hypr" = {
    source = ./dotfiles/hypr;
    recursive = true;
  };
  home.file.".config/kate" = {
    source = ./dotfiles/kate;
    recursive = true;
  };
  home.file.".config/MangoHUD" = {
    source = ./dotfiles/MangoHUD;
    recursive = true;
  };
  home.file.".config/waybar" = {
    source = ./dotfiles/waybar;
    recursive = true;
  };
  home.file.".config/input-remapper-2" = {
    source = ./dotfiles/input-remapper-2;
    recursive = true;
  };
  home.file.".config/wlogout" = {
    source = ./dotfiles/wlogout;
    recursive = true;
  };
  home.file.".config/swaync" = {
    source = ./dotfiles/swaync;
    recursive = true;
  };
  home.file.".config/btop" = {
    source = ./dotfiles/btop;
    recursive = true;
  };
  home.file.".config/cava" = {
    source = ./dotfiles/cava;
    recursive = true;
  };
  home.file.".config/wofi" = {
    source = ./dotfiles/wofi;
    recursive = true;
  };
  home.file.".config/alacritty" = {
    source = ./dotfiles/alacritty;
    recursive = true;
  };
  home.file.".config/fzf_dirs.txt" = {
    source = ./dotfiles/fzf_dirs.txt;
    recursive = true;
  };
  #home.file.".config/Thunar" = {
    #source = ./dotfiles/Thunar;
    #recursive = true;
  #};
}
