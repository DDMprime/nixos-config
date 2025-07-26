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
      waybar # панель задач
      kitty # терминал
      mako # демон уведомлений
      alacritty # терминал
      mpvpapper # анимированные обои
      hyprlock # экран блокировки wayland
      hyprshot # инструмент для создания скриншотов wayland
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
