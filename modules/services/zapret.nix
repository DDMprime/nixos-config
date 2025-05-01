{ lib, config, ... }:

{
  options = {
    zapret.enable =
      lib.mkEnableOption "enables zapret";
  };


  config = lib.mkIf config.zapret.enable {

    services.resolved.enable = true;
    services.cron.enable = true;
    systemd.services.zapret = {
        description = "Zapret DPI bypass service";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
        ExecStart = "/home/ddm/nixos-config/modules/services/zapret/init.d/sysv/zapret start";
        ExecStop = "/home/ddm/nixos-config/modules/services/zapret/init.d/sysv/zapret stop";
        RemainAfterExit = true;
        Environment = "PATH=/run/current-system/sw/bin:/run/wrappers/bin:/root/.nix-profile/bin:/usr/bin:/bin";
        };
    };
  };
}
