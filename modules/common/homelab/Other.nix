{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Other
    home-manager
    flatpak # для установки пакетов с flatpak'а
  ];
}
