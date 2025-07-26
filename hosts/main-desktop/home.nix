{
  imports = [
    ./../../home-manager/home-bundle.nix
  ];

  home = {
    username = "ddm";
    homeDirectory = "/home/ddm";
    stateVersion = "25.05";
  };

  niri.enable = true;
  hyprland.enable = false;
}
