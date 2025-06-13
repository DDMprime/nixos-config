{ lib, config, ... }:

{
  options = {
    zapret.enable =
      lib.mkEnableOption "enables zapret";
  };


  config = lib.mkIf config.zapret.enable {

    #services.resolved.enable = true;
    #services.cron.enable = true;
    #systemd.services.zapret = {
        #description = "Zapret DPI bypass service";
        #after = [ "network.target" ];
        #wantedBy = [ "multi-user.target" ];

        #serviceConfig = {
        #ExecStart = "/home/ddm/nixos-config/modules/services/zapret/init.d/sysv/zapret start";
        #ExecStop = "/home/ddm/nixos-config/modules/services/zapret/init.d/sysv/zapret stop";
        #RemainAfterExit = true;
        #Environment = "PATH=/run/current-system/sw/bin:/run/wrappers/bin:/root/.nix-profile/bin:/usr/bin:/bin";
      #};
    #};

    services.zapret = {
      enable = true;
      udpSupport = true;
      udpPorts = ["50000:50099" "443"];
      whitelist = [
        "youtube.com"
        "googlevideo.com"
        "ytimg.com"
        "youtu.be"
        "discord.com"
      ];
      params = [
        "--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=6 --new"
        "--filter-udp=50000-50099 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new"
        "--filter-tcp=80 --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
        "--filter-tcp=443 --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2"
      ];
    };

  };
}
