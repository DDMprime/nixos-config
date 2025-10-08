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

      # Библиотеки для GL
      libGL
      libGLU
      xorg.libX11
      xorg.libXext
      xorg.libXrandr
      xorg.libXxf86vm
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
    ];
  };
}
