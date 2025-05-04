{ lib, config, ... }:

{
  options = {
    tailscale.enable =
      lib.mkEnableOption "enables tailscale";
  };

  config = lib.mkIf config.tailscale.enable {
    # Включение сервиса Tailscale
    services.tailscale.enable = true;

    # Укажите ключ аутентификации (рекомендуется использовать безопасное хранилище для секретов)
    services.tailscale.authKey = "ngHZ4iWuqw11CNTRL"; # Замените на ваш ключ

    # Настройка firewall (обычно не требуется, сервис делает это автоматически)
    networking.firewall = {
        checkReversePath = "loose"; # Важно для работы Tailscale
        trustedInterfaces = [ "tailscale0" ];
    };

  };
}
