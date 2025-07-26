{ pkgs, ... }:

{
  # Шрифты
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      font-awesome
      #font-awesome_5
      #font-awesome_4
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };

}
