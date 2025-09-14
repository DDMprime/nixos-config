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
    lutris
    telegram-desktop
    obsidian
    discord
    spotify
    xfce.thunar # файловый менеджер
    prismlauncher
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
    freetube # ютуб
    retroshare
    audacity # редактирование аудио
    rare # epic games GUI
    gimp # для создания изображений и их редактирования
    inkscape # для создания векторного видео
    easyeffects # смена голоса
    keepassxc # менеджер паролей
    xarchiver # универсальный архиватор
    anki # учить слова на английском
    librewolf # firefox с вырезанной телеметрией и встроенной защитой
    hexchat # IRC мессенджер
    hyprpanel
  ];
}
