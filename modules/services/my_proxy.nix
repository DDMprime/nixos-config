{
  services.dante = {
    enable = true;
    internalInterfaces = [ "0.0.0.0" ];
    externalInterface = "eth0"; # замени на свой интерфейс
    port = 1080;
  };
}
