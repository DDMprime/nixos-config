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
            PermitRootLogin = "yes";
            PasswordAuthentication = true;
        };
    };

    # Разрешаем доступ по SSH через firewall (если используется)
    #networking.firewall.allowedTCPPorts = [ 22 ];
    networking.firewall.interfaces."zt+" = {
      allowedTCPPorts = [ 22 ];
    };
  };
}
