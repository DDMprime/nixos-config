{ lib, config, ... }:

{
  options = {
    i2p.enable =
      lib.mkEnableOption "enables i2p";
  };


  config = lib.mkIf config.i2p.enable {
        services.i2pd = {
            enable = true;
            dataDir = "/var/lib/i2pd";
            logLevel = "debug";
            # Серверный тунель для входящих соединений
            inTunnels.retroshare = {
                enable = true;
                keys = "retroshare.dat";
                address = "127.0.0.1";
                port = 12346;
                destination = "server";
                inbound.quantity = 1;
                inbound.length = 3;
                outbound.quantity = 1;
                outbound.length = 3;
            };
            # Клиентский тунель для исходящих соединений
            proto.socksProxy = {
                enable = true;
                address = "127.0.0.1";
                port = 4447;
#                 outproxyEnable = true;  # Выход в клирнет через аутпрокси
#                 outproxy = "proxy.eepb.i2p";  # Аутпрокси по умолчанию
#                 outproxyPort = 4444;     # Порт аутпрокси
            };

#             proto.httpProxy = {
#                 enable = true;
#                 address = "127.0.0.1";
#                 port = 4444;
#             };

            proto.http = {
                enable = true;
                address = "127.0.0.1";
                port = 7070;
                auth = false;
                strictHeaders = false;
            };

        };
    };
}
