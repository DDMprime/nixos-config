{lib, config, ... }:

{
  options = {
    rustdesk.enable =
      lib.mkEnableOption "enables rustdesk";
  };


  config = lib.mkIf config.rustdesk.enable {
    services.rustdesk-server.enable = true;
    services.rustdesk-server.openFirewall = true;


  };
}
