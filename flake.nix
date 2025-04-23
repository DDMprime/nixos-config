{
  description = "My NixOS + Home‑Manager Configuration for Desktop & Laptop Profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        stablePkgs = import nixpkgs-stable { inherit system; };

        stableOverlay = final: prev: {
          stable = stablePkgs;
        };

        mkConfig = args: pkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self; };

          nixpkgs.overlays = [ stableOverlay ];

          modules =
            [
              ./modules/common/options.nix      # свои опции (gpu, rice и т.д.)
              ./modules/common/packages.nix     # общие пакеты
              # аппаратные драйверы – динамически через config.my.gpu
              ./modules/hardware/amd-gpu.nix
              ./modules/hardware/nvidia-gpu.nix
              # сервисы: hyprland, pipewire, vpn и т.п.
              ./modules/services/hyprland.nix
              ./modules/services/pipewire.nix
              ./modules/services/vpn.nix
              ./modules/services/steam.nix
              # готовый образ: desktop или laptop
              args.environmentModule
              # host-specific: hostName, fileSystems, sshKeys
              args.hostModule
            ] ++ (if args.extraModules != null then args.extraModules else []);

          # Позволяет задать config.my.* прямо здесь
          configuration = args.configuration or { };
        };
      in
      {
        # NixOS-конфигурации
        nixosConfigurations = {
          # Основной профиль "desktop"
          desktop = mkConfig {
            environmentModule = ./modules/environments/desktop.nix;
            hostModule = ./nixos/hosts/desktop-host.nix;
            configuration = {
              # по умолчанию: NVIDIA + стандартный rice
              my.gpu = "nvidia";
              my.enableAltRice = false;
            };
          };

          # Альтернативный rice (тот же графический стек, но кастом‑rice)
          altRice = mkConfig {
            environmentModule = ./modules/environments/desktop.nix;
            hostModule = ./nixos/hosts/desktop-host.nix;
            configuration = {
              my.gpu = "nvidia";
              my.enableAltRice = true;
            };
          };

          # Профиль для AMD GPU
          amdProfile = mkConfig {
            environmentModule = ./modules/environments/desktop.nix;
            hostModule = ./nixos/hosts/desktop-host.nix;
            configuration = {
              my.gpu = "amd";
              my.enableAltRice = false;
            };
          };

          # Профиль для laptop (с дополнительными модулями: power management)
#           laptop = mkConfig {
#             environmentModule = ./modules/environments/laptop.nix;
#             hostModule = ./nixos/hosts/laptop-host.nix;
#             configuration = {
#               my.gpu = "amd";
#               my.enableAltRice = false;
#             };
#           };
         };

        # Home‑Manager-конфигурация для пользователя "ddm"
        homeConfigurations = {
          ddm = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home-manager/home.nix  # точка входа для всех пользовательских модулей
            ];
          };
        };

        # Здесь можно добавить devShells, nixosTests, сборку ISO и т.д.
      });
}
