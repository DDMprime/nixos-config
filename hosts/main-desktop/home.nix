{
  imports = [
    ./../../home-manager
  ];

  home = {
    username = "ddm";
    homeDirectory = "/home/ddm";
    stateVersion = "25.05";
  };

  niri.enable = false;
  hyprland.enable = true;
}
