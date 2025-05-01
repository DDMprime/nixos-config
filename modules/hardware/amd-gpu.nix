{ config, lib, ... }:

{
  options = {
    steam.amdgpu =
      lib.mkEnableOption "enables amd gpu";
  };


  config = lib.mkIf config.amdgpu.enable {

    services.xserver.videoDrivers = [ "amdgpu" ];

  };
}
