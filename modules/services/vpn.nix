{ lib, config, ... }:

{
  options = {
    zerotier.enable =
      lib.mkEnableOption "enables zerotier";
  };


  config = lib.mkIf config.zerotier.enable {

    services.zerotierone = {
        enable = true;
        joinNetworks = [ "a0cbf4b62a02d645" ]; # ID сети zerotier
    };
    networking.firewall = {
        trustedInterfaces = [ "zt*" ];  # Разрешить весь трафик ZeroTier
        allowedTCPPorts = [ 25565 ];    # Порт Minecraft
    };
  };
}
