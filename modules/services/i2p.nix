{ lib, config, ... }:

{
  options = {
    i2p.enable =
      lib.mkEnableOption "enables i2p";
  };


  config = lib.mkIf config.i2p.enable {
    services.i2pd = {
        enable = true;

        # Включить SAM протокол для RetroShare
        proto.sam.enable = true;
        proto.sam.port = 7656;
        proto.sam.address = "127.0.0.1";

        # Включить web-интерфейс для отладки
        proto.http.enable = true;
        proto.http.port = 7070;
        proto.http.address = "127.0.0.1";

        # Включить UPnP для входящих соединений (если за NAT)
        upnp.enable = true;

        # Ресид сервера (если нет свежей базы)
        reseed.urls = [
        "https://reseed.i2p-projekt.de/"
        "https://i2p.mooo.com/netDb/"
        ];

        # Открыть firewall для нужных портов (если надо)
        openFirewall = true;

    };
  };
}
