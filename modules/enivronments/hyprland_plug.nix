{ lib, pkgs, inputs, config, ... }:

with lib; let
  hyprPluginPkgs = inputs.hyprland-plugins.packages.${pkgs.system};
  hypr-plugin-dir = pkgs.symlinkJoin {
    name = "hyrpland-plugins";
    paths = with hyprPluginPkgs; [
      hyprexpo
      #...plugins
    ];
  };
in
{
  config = lib.mkIf config.hyprland.enable {
    environment.sessionVariables = { HYPR_PLUGIN_DIR = hypr-plugin-dir; };
  };
}
