{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.niri.enable {
    environment.systemPackages = with pkgs; [
      # WM stuff
      niri # окружение
      xwayland-satellite # xwayland для niri
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-user-dirs
      waybar # панель задач
      kitty # терминал
      mako # демон уведомлений
      alacritty # терминал
      #mpvpaper # анимированные обои
      hyprlock # экран блокировки wayland
      hyprshot # инструмент для создания скриншотов wayland
      tofi # меню приложений
      #pulseaudio # для расширенной настройки звука
      wlogout # меню выхода/перезагрузки/блокировки/сна
      zsh # zsh оболочка для терминала
      zsh-syntax-highlighting
      quickshell
      mpvpaper

      # Настройки GTK/QT
      libsForQt5.qt5ct # настройка qt5ct
      kdePackages.qt6ct # настройка qt6
      kdePackages.qtwayland
      kdePackages.qtstyleplugin-kvantum #kvantum
      libsForQt5.qtstyleplugin-kvantum #kvantum
      nwg-look #для удобной настройки тем gtk
      polkit_gnome #для запроса повышения прав приложения
      nordic # тема nord
      nordzy-icon-theme # адекватные иконки nord
      catppuccin
    ];
  };
}
