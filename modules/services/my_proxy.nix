{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gost ];

  systemd.services.gost-tor = {
    description = "SOCKS5 proxy -> Tor";
    after = [ "network.target" "tor.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = ''
        ${pkgs.gost}/bin/gost \
          -L socks5://192.168.195.156:1080 \
          -F socks5://127.0.0.1:34051
      '';
      Restart = "always";
      RestartSec = 2;
      User = "nobody";
    };
  };

  networking.firewall.allowedTCPPorts = [ 1080 ];
}

