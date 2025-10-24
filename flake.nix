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
      system = "x86_64-linux";
      user = "ddm";
      hyprland_enabled = true;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system user hyprland_enabled;};
        modules = [
          ./overlays
          ./hosts/main-desktop/desktop-host.nix
          #inputs.home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
        ];
      };



      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit user hyprland_enabled; };
        modules = [ ./hosts/main-desktop/home.nix ];
      };
    };
}
