{ pkgs, config, lib, ... }:

{
  options = {
    NiriStuff.enable =
      lib.mkEnableOption "download packages for niri";
  };


  config = lib.mkIf config.HyprlandStuff.enable {
    environment.systemPackages = with pkgs; [
      # WM stuff
      niri # окружение
      xwayland-satellite # xwayland для niri
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      waybar # панель задач
      kitty # терминал по умолчанию в hyprland
      mako # демон уведомлений
      alacritty # терминал
      swww # обои
      hyprlock # экран блокировки hyprland
      hyprshot # инструмент для создания скриншотов в hyprland
      tofi # меню приложений
      #pulseaudio # для расширенной настройки звука
      wlogout # меню выхода/перезагрузки/блокировки/сна
      zsh # zsh оболочка для терминала
      zsh-syntax-highlighting

      # Настройки GTK/QT
      libsForQt5.qt5ct # настройка qt5ct
      kdePackages.qt6ct # настройка qt6
      kdePackages.qtwayland
      kdePackages.qtstyleplugin-kvantum #kvantum
      libsForQt5.qtstyleplugin-kvantum #kvantum
      gtk-engine-murrine #для gtk тем
      gnome-themes-extra #adwaita темы для gtk
      nwg-look #для удобной настройки тем gtk
      polkit_gnome #для запроса повышения прав приложения
      nordic # тема nord
      nordzy-icon-theme # адекватные иконки nord
      (pkgs.catppuccin-gtk.override {
        accents = [ "red" ];    # Акцентный цвет
        variant = "mocha";      # Вариант Mocha
      })
    ];
  };
}
