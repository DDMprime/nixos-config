{
  description = "My NixOS conf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05"; #stable ветка
    #old-nixpkgs.url = "github:NixOS/nixpkgs/c9b6fb798541223bbb396d287d16f43520250518"; # версия пакетов 2025.09.14

    nvf.url = "github:notashelf/nvf"; # neovim настройка

    spicetify-nix.url = "github:Gerg-L/spicetify-nix"; # кастомный спотифай

    hyprland.url = "github:hyprwm/Hyprland"; # окружение wayland
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    niri-unstable.url = "github:YaLTeR/niri";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-unstable";
    }; # окружение wayland

    home-manager = {
      url = "github:nix-community/home-manager"; #release-24.11 stable
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, spicetify-nix, ...}@inputs:
    let
      Config = import ./hosts/main-desktop/user_config.nix;
      UserConfig = Config;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs UserConfig;};
        modules = [
          ./overlays
          ./hosts/main-desktop/desktop-host.nix
          #inputs.home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
        ];
      };



      homeConfigurations.${UserConfig.user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${UserConfig.system};
        extraSpecialArgs = { inherit UserConfig; };
        modules = [ ./hosts/main-desktop/home.nix ];
      };
    };
}
