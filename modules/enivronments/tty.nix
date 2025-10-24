{ lib, config,  ... }:

{
  options = {
    tty.enable =
      lib.mkEnableOption "enables tty";
  };


  config = lib.mkIf config.tty.enable {
    services.xserver.enable = false;
    services.dbus.enable = true;
 
  };
}
