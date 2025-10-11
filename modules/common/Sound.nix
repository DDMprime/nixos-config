{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Sound
    pipewire # взаимодействие с настройками звука сторонними приложениями
    pwvucontrol # панель для управления звуком pipewire
    easyeffects # настройка микрофона
  ];
}
