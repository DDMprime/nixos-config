{ lib, config, ... }:

{
  options = {
    ssh.enable =
      lib.mkEnableOption "enables ssh";
  };


  config = lib.mkIf config.ssh.enable {

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };
    
    networking.firewall.allowedTCPPorts = [ 22 ];
  };
}
