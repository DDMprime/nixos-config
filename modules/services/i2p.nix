{ lib, config, UserConfig, ... }:

{
  options = {
    i2p.enable =
      lib.mkEnableOption "enables i2p";
  };


  config = lib.mkIf config.i2p.enable {
    services.yggdrasil = {
      enable = true;
      persistentKeys = true;

      settings = {
        Peers = [
          "tcp://srv.itrus.su:7991"
          "tls://srv.itrus.su:7992"
          "tls://ip4.01.tom.ru.dioni.su:9003"
        ];
      };
    };


    services.i2pd = {
      enable = true;
      #enableIPv4 = false;
      #enableIPv6 = true;
      #ssu = false;
      #ntcp = false;
      #address = "200:2b3e:a2dc:7f2b:b881:4c09:f9ba:f574";
      #yggdrasil.enable = true;
      #yggdrasil.address = "200:2b3e:a2dc:7f2b:b881:4c09:f9ba:f574";
      #ssu2.enable = true;
      #ssu2.published = true;
      #ntcp2.enable = true;
      #ntcp2.published = true;
      dataDir = "/var/lib/i2pd";
      logLevel = "debug";
      # Серверный тунель для входящих соединений
      inTunnels.retroshare = {
          enable = true;
          keys = "retroshare.dat";
          address = "127.0.0.1";
          port = 12346;
        #destination = "server";
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
      outTunnels.acetone-irc = {
        enable = true;
        destination = "irc.acetone.i2p";
        address = "127.0.0.1";
        port = 6667;
        destinationPort = 6667;
        keys = "acetone-irc.dat";
      };
    };
    services.znc = {
      enable = true;
      openFirewall = true;
      mutable = true;
      useLegacyConfig = false;
      dataDir = "/znc";
      user = UserConfig.user;
      group = "users";
      config = {
        LoadModule = [ "webadmin" "adminlog" "log" ];
        User.paul = {
          Admin = true;
          Nick = "paul";
          AltNick = "paul11";
          LoadModule = [ "chansaver" "controlpanel" ];
          Network.acetone = {
            Server = "127.0.0.1";
            Port = "6667";
            LoadModule = [ "simple_away" "log" ];
            Chan = {
              "#ru" = { Detached = false; };
            };
          };
          Pass.password = {
            Method = "sha256";
            Hash = "02cf27c463e231e31671bb2e39571489a2042badbe713fa6b34c637bd861b1e2";
            Salt = "PGw0j!,6wrRYYF-!5uo1";
          };
        };
      };
    };
  };
}
