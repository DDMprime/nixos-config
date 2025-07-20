{ lib, config, ... }:

{
  options = {
    samba.enable =
      lib.mkEnableOption "enables samba";
  };

  config = lib.mkIf config.samba.enable {
        services.samba = {
        enable = true;
        openFirewall = true;

        settings = {
            global = {
            security = "user";
            mapToGuest = "Bad User";
            guestAccount = "nobody";
            };
            public = {
            path = "/mnt/Shared";
            browseable = true;
            writable = true;
            guestOk = true;
            public = true;
            createMask = "0666";
            directoryMask = "0777";
            };
        };
    };
  };
}
