{ lib, config, ... }:

{
  options = {
    tailscale.enable =
      lib.mkEnableOption "enables tailscale";
  };

  config = lib.mkIf config.tailscale.enable {
    services.tailscale.enable = true;

    services.tailscale.openFirewall = true;
      networking.nftables.enable = true;

      networking.nftables.ruleset = ''
        table inet filter {
          chain output {
            type filter hook output priority 0;
            ip daddr 95.217.2.165 tcp dport 443 accept
            ip daddr 34.117.59.81 tcp dport 443 accept  # пример IP controlplane.tailscale.com
          }
        }
      '';

  };
}
