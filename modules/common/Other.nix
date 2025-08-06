{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Other
    home-manager
    qemu # гипервизор для виртуальных машин
    qemu_kvm # библиотека qemu kvm
    v4l-utils # для работы с v4l2
    flatpak # для установки пакетов с flatpak'а
  ];
}
