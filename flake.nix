{
  description = "My NixOS conf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05"; #stable ветка
    old-nixpkgs.url = "github:NixOS/nixpkgs/c9b6fb798541223bbb396d287d16f43520250518"; # версия пакетов 2025.09.14

    nvf.url = "github:notashelf/nvf"; #neovim настройка

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    home-manager = {
      url = "github:nix-community/home-manager"; #release-24.11 stable
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, spicetify-nix, old-nixpkgs, ...}@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system old-nixpkgs;};
        modules = [
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                stable = inputs.nixpkgs-stable.legacyPackages.${prev.system}; #добавляем оверлей для стабильной ветки. Вызывается с помощью pkgs.stable
                old-pkgs = old-nixpkgs.legacyPackages.${prev.system};
              })
              #(import ./overlays/nvidia-overlay.nix)
            ];
          })
          ./hosts/main-desktop/desktop-host.nix
          #inputs.home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          inputs.spicetify-nix.nixosModules.default

#           ({ config, pkgs, ... }: {
#             #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mine;
#             #hardware.nvidia.package = pkgs.linuxPackages.nvidiaPackages.mine;
#             hardware.nvidia.package = pkgs.linuxPackages.nvidiaPackages.mine;
#           })
        ];
      };



      homeConfigurations.ddm = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./hosts/main-desktop/home.nix ];
      };
    };
}
