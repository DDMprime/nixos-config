{ config, lib, ... }:

lib.mkIf (config.my.gpu == "amd") {
  services.xserver.videoDrivers = [ "amdgpu" ];
}
