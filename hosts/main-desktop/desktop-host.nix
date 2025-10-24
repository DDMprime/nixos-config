{ config, pkgs, UserConfig, ... }:

{
  # Импорт hardware-configuration
  imports = [
      ./hardware-configuration.nix
      ./mount_disks.nix
      ./../../modules
      #inputs.home-manager.nixosModules.home-manager
  ];
  #включаемые модули
  hyprland.enable = UserConfig.ConfigFile.hyprland.enable;
  niri.enable = UserConfig.ConfigFile.niri.enable;
  zsh.enable = UserConfig.ConfigFile.zsh.enable;
  nvidia.enable = UserConfig.ConfigFile.nvidia.enable;
  input_remapper.enable = UserConfig.ConfigFile.input_remapper.enable;
  zerotier.enable = UserConfig.ConfigFile.zerotier.enable;
  tailscale.enable = UserConfig.ConfigFile.tailscale.enable;
  zapret.enable = UserConfig.ConfigFile.zapret.enable;
  ssh.enable = UserConfig.ConfigFile.ssh.enable;
  i2p.enable = UserConfig.ConfigFile.i2p.enable;
  samba.enable = UserConfig.ConfigFile.samba.enable;
  steam.enable = UserConfig.ConfigFile.steam.enable;

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

  #раскладка клавиатуры
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  #home-manager.users.${user} = import ./home.nix;
  #services.flatpak.enable = true; # включение флетпака

  # Пользователь
  users.users.${UserConfig.user} = {
    isNormalUser = true;
    description = UserConfig.user;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Автоматический вход (можно выключить для безопасности)
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = UserConfig.user;

  services.logind.settings.Login.KillUserProcesses = true; # Завершение всех пользовательских процессов при выключении

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #boot.kernelPackages = old-nixpkgs.legacyPackages.x86_64-linux.linuxPackages_6_12; #latest ядро, стабильное (LTS) - 6_12
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ]; #для создания виртуальной камеры
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';


  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  nixpkgs.config.allowUnfree = true;
#   nixpkgs.config.nvidia.acceptLicense = true;

  programs.fuse.userAllowOther = true; # для appimage

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;

  system.stateVersion = "25.05";
}
