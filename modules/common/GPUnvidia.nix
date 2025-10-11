{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.nvidia.enable {
    environment.systemPackages = with pkgs; [
      # GPU stuff
      nvidia-vaapi-driver # vaapi ускорение
      vaapiVdpau # vaapi ускорение
      libva
      libdrm
      libglvnd
      libva-utils
      libvdpau
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      mesa
      cudatoolkit # для работы CUDA
      cudaPackages.cudnn # для работы CUDA
    ];
  };
}
