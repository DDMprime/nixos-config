{ lib, ... }:

{
  options.my = {
    gpu = lib.mkOption {
      type = lib.types.str;
      default = "nvidia";
      description = "Тип видеокарты: nvidia или amd";
    };

    enableAltRice = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Использовать альтернативный rice оформления";
    };
  };
}
