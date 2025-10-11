{ pkgs,  ... }:

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
    }) # гугл хром с поддержкой nvidia
    lutris # запуск эпик геймса
    telegram-desktop # мессенджер телеграм
    obsidian # заметки
    discord
    xfce.thunar # файловый менеджер
    prismlauncher # маинкрафт лаунчер
    qbittorrent # торрент-клиент
    mpv # видео-плеер
    libreoffice-qt6-fresh # либреоффис. Аналог word'а
    tor-browser
    input-remapper # для биндов
    nicotine-plus # для подключения к сети soulseek
    mangohud # для статистики в играх
    qtox # для общения
    obs-studio # захват экрана
    vesktop #клиент дискорда с vencord'ом
    kdePackages.kate # редактор кода kate
    qview # для просмотра изображений
    kdePackages.elisa # аудиоплеер
    firefox # браузер
    freetube # ютуб
    stable.retroshare
    audacity # редактирование аудио
    rare # epic games GUI
    gimp3-with-plugins # для создания изображений и их редактирования
    inkscape # для создания векторного видео
    keepassxc # менеджер паролей
    xarchiver # универсальный архиватор
    anki # учить слова на английском
    librewolf # firefox с вырезанной телеметрией и встроенной защитой
    hexchat # IRC мессенджер
  ];
}
