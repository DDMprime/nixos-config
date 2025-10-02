{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # CLI utils
    wget
    jq # чтобы парсить json
    ydotool # для автокликера
    gowall # работа с обоями
    grim # для более подробной настройки создания скриншотов
    slurp # для получения области на экране (в комбинации с grim - выбор области для скрина)
    wl-clipboard # для работы с буфером обмена в wayland
    yt-dlp # cli приложения для взаимодействия с ютубом
    ffmpeg
    spotify-cli-linux # cli клиент spotify, собираю метаданные песен им
    zip # архиватор zip
    unzip # для разархивирования zip
    unrar # для разархивирования rar
    cryptsetup
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
    jdk24 # для сервера
    plex
    i2pd
    libopus # для кодека opus
  ];
}
