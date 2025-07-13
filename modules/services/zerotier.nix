{ lib, config, ... }:

{
  options = {
    zerotier.enable =
      lib.mkEnableOption "enables zerotier";
  };


  config = lib.mkIf config.zerotier.enable {

    services.zerotierone = {
        enable = true;
        joinNetworks = [ "363c67c55aec434b" ]; # ID сети zerotier
    };
    networking.firewall = {
        trustedInterfaces = [ "zt*" ];  # Разрешить весь трафик ZeroTier
        allowedTCPPorts = [ 25565 ];
        allowedUDPPorts = [9993];  # Порт ZeroTier
    };
  };
}
