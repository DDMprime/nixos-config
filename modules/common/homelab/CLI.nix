{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # CLI utils
    wget
    jq # чтобы парсить json
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
    btop # красивый htop
    android-tools # для подключения по adb
    fzf # для отображения и работы с директориями в терминале
    eza # для статистики (улучшенный ls)
    jdk25 # для сервера
    i2pd
    libopus # для кодека opus
    cmus # CLI аудиоплеер
  ];
}
