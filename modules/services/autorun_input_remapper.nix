{ pkgs, lib, config, UserConfig, ... }:

{
  options = {
    input_remapper.enable =
      lib.mkEnableOption "enables auto input remapper";
  };


  config = lib.mkIf config.input_remapper.enable {

    systemd.services.StartInputRemapperDaemonAtLogin = {
      enable = true;
      description = "Start input-remapper daemon after login";
      serviceConfig = {
          Type = "simple";
      };
      script = lib.getExe(pkgs.writeShellApplication {
          name = "start-input-mapper-daemon";
          runtimeInputs = with pkgs; [input-remapper procps su];
          text = ''
            until pgrep -u ${UserConfig.user}; do
              sleep 1
            done
            sleep 2
            until [ $(pgrep -c -u root "input-remapper") -gt 1 ]; do
              input-remapper-service&
              sleep 1
              input-remapper-reader-service&
              sleep 1
            done
            su ${UserConfig.user} -c "input-remapper-control --command stop-all"
            su ${UserConfig.user} -c "input-remapper-control --command autoload"
            sleep infinity
          '';
      });
      wantedBy = [ "default.target" ];
    };

    systemd.services.ReloadInputRemapperAfterSleep = {
        enable = true;
        description = "Reload input-remapper config after sleep";
        after = [ "suspend.target" ];
        serviceConfig = {
          User = UserConfig.user;
      Type = "forking";
        };
        script = lib.getExe(pkgs.writeShellApplication {
            name = "reload-input-mapper-config";
            runtimeInputs = with pkgs; [input-remapper ps gawk];
            text = ''
                input-remapper-control --command stop-all
                input-remapper-control --command autoload
                sleep 1
                until [[ $(ps aux | awk '$11~"input-remapper" && $12="<defunct>" {print $0}' | wc -l) -eq 0 ]]; do
                  input-remapper-control --command stop-all
                  input-remapper-control --command autoload
                  sleep 1
                done
          '';
        });
        wantedBy = [ "suspend.target" ];
    };
  };
}
