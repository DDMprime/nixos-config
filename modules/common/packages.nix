{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Desktop apps
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
        "--enable-features=UseMultiPlaneFormatForHardwareVideo"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        "--ozone-platform=wayland"
      ];
    })
    telegram-desktop
    discord
    spotify
    qbittorrent # торрент-клиент
    stable.mpv # видео-плеер
    libreoffice-qt6-fresh
    tor-browser
    input-remapper # для биндов
    nicotine-plus # для подключения к сети soulseek
    koboldcpp # запуск ИИ
    mangohud # для статистики в играх
    qtox # для общения
    obs-studio # захват экрана
    vesktop #клиент дискорда с vencord'ом
    kdePackages.kate # редактор кода kate
    qview # для просмотра изображений
    kdePackages.elisa # аудиоплеер
    firefox # браузер
    freetube
    retroshare
    rare # epic games GUI

    # Coding stuff
    gnumake # для сборки
    gcc # компилятор
    stable.python313 # стабильная версия python'а
    stable.python313Packages.pip
    nil # LSP сервер для .nix

    # Network managment
    curl
    ipset
    zapret
    iptables # для zapret'а
    nftables # для zapret'а


    # CLI utils
    wget
    grim # для более подробной настройки создания скриншотов
    slurp # для получения области на экране (в комбинации с grim - выбор области для скрина)
    wl-clipboard # для работы с буфером обмена в wayland
    yt-dlp # cli приложения для взаимодействия с ютубом
    ffmpeg
    spotify-cli-linux # cli клиент spotify, собираю метаданные песен им
    zip # архиватор zip
    unzip # для разархивирования zip
    unrar # для разархивирования rar
    p7zip # архиватор 7z
    fastfetch # cli приложение для отображения информации о системе
    tree # красивое отображение дерева директорий
    wineWowPackages.stable # вайн
    winetricks # вайн
    btop # красивый htop
    android-tools # для подключения по adb
    appimage-run # для запуска appimage
    fuse # для работы приложений appimage
    cava # визуализация аудио
    fzf # для отображения и работы с директориями в терминале
    eza # для статистики (улучшенный ls)
    #jre8 # для tlauncher'а
    jdk17 # для сервера
    plex
    logmein-hamachi

    # Sound
    pipewire # взаимодействие с настройками звука сторонними приложениями
    pwvucontrol # панель для управления звуком pipewire

    # GPU stuff
    nvidia-vaapi-driver # vaapi ускорение
    vaapiVdpau # vaapi ускорение
    libva
    libdrm
    libglvnd
    libva-utils
    libvdpau
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    mesa
    cudatoolkit # для работы CUDA
    cudaPackages.cudnn # для работы CUDA

    # WM stuff
    hyprland # основная wm
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    waybar # панель задач
    kitty # терминал по умолчанию в hyprland
    #dunst # демон уведомлений по умолчанию в hyprland
    #alacritty # прошлый терминал, конфиг под milk рис
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
    xfce.thunar # файловый менеджер
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

    # Other
    home-manager
    qemu # гипервизор для виртуальных машин
    qemu_kvm # библиотека qemu kvm
    v4l-utils # для работы с v4l2
  ];

  # Шрифты
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      #font-awesome_5
      #font-awesome_4
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };

}
