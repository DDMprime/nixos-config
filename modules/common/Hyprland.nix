{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = with pkgs; [
      # WM stuff
      hyprland # окружение
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      waybar # панель задач
      kitty # терминал по умолчанию в hyprland
      #dunst # демон уведомлений по умолчанию в hyprland
      alacritty # прошлый терминал, конфиг под milk рис
      hyprland-qt-support # для приложений, использующих qt6
      hyprpaper # обои в hyprland
      hyprlock # экран блокировки hyprland
      hyprshot # инструмент для создания скриншотов в hyprland
      #wofi # меню приложений
      rofi-wayland-unwrapped # тоже меню приложений
      rofimoji # меню смайликов 😉
      swaynotificationcenter # демон уведомлений sway'а
      pyprland # чуть более расширенная настройка hyprland'а
      pulseaudio # для расширенной настройки (нужен waybar'у)
      wlogout # меню выхода/перезагрузки/блокировки/сна
      zsh # zsh оболочка для терминала
      zsh-syntax-highlighting
      playerctl # отображение звука на waybar

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
      catppuccin # тема catppuccin
      nordic # тема nord
      nordzy-icon-theme # адекватные иконки nord
      (pkgs.catppuccin-gtk.override {
        accents = [ "red" ];    # Акцентный цвет
        variant = "mocha";      # Вариант Mocha
      })
    ];
  };
}
