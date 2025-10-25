{ pkgs, UserConfig, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./../../modules
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
  tty.enable = UserConfig.ConfigFile.ssh.enable;

  #имя хоста и локали
  networking = {
    hostName = "nixos-homelab";
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

  #services.flatpak.enable = true; # включение флетпака

  # Пользователь
  users.users.${UserConfig.user} = {
    isNormalUser = true;
    description = UserConfig.user;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIS7GJoQjpjSZllFoZOrPB2kMIpPvoOTDEr6wbAU2orv" ];
  };
  
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  #boot.kernelPackages = old-nixpkgs.legacyPackages.x86_64-linux.linuxPackages_6_12; #latest ядро, стабильное (LTS) - 6_12
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;

  system.stateVersion = "25.05";
}
