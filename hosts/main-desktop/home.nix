{ UserConfig, ... }: {
  imports = [
    ./../../home-manager
  ];

  home = {
    username = UserConfig.user;
    homeDirectory = "/home/${UserConfig.user}";
    stateVersion = "25.05";
  };

  niri.enable = UserConfig.ConfigFile.niri.enable;
  hyprland.enable = UserConfig.ConfigFile.hyprland.enable;
}
