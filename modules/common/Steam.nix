{ pkgs, lib, config, ... }:

{
  options = {
    steam.enable =
      lib.mkEnableOption "enables steam";
  };


  config = lib.mkIf config.steam.enable {
    environment.systemPackages = with pkgs; [ steam ];

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;  # Открывает порты для Remote Play
      dedicatedServer.openFirewall = true; # Для серверов
      extraPackages = with pkgs; [
        gst_all_1.gst-libav
        gst_all_1.gst-plugins-bad
        protonup
      ];
    };

    environment.sessionVariables = {
      WINEDLLOVERRIDES = "wmvcore=n,b;mfplay=n,b";
    };
  };
}
