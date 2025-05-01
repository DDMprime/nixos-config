{
  description = "My NixOS conf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11"; #stable ветка

    home-manager = {
      url = "github:nix-community/home-manager"; #release-24.11 stable
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                stable = inputs.nixpkgs-stable.legacyPackages.${prev.system}; #добавляем оверлей для стабильной ветки. Вызывается с помощью pkgs.stable
              })
            ];
          })
          ./hosts/main-desktop/desktop-host.nix
        ];
      };

      homeConfigurations.ddm = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./hosts/main-desktop/home.nix ];
      };
    };
}
