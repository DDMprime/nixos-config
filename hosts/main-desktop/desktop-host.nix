{ config, pkgs, ... }:

{
  # Импорт hardware-configuration
  imports = [
      ./hardware-configuration.nix
      ./mount_disks.nix
      ./../../modules/bundle.nix
  ];
  #включаемые модули
  hyprland.enable = true;
  zsh.enable = true;
  nvidia.enable = true;
  input_remapper.enable = true;
  steam.enable = true;
  zerotier.enable = true;
  tailscale.enable = false;
  zapret.enable = true;
  ssh.enable = false;

  #имя хоста и локали
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Включаем SSH для управления
  #services.openssh.enable = true;

  # Пользователь
  users.users.ddm = {
    isNormalUser = true;
    description = "DDM";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Автоматический вход (можно выключить для безопасности)
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ddm";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; #latest ядро, стабильное (LTS) - 6_12

  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ]; #для создания виртуальной камеры
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';


  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  nixpkgs.config.allowUnfree = true;
  programs.fuse.userAllowOther = true; # для appimage

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;

  system.stateVersion = "25.05";
}
