{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Coding stuff
    gnumake # для сборки
    cmake
    gcc # компилятор
    stable.python313 # стабильная версия python'а
    stable.python313Packages.pip
    nil # LSP сервер для .nix
  ];
}
