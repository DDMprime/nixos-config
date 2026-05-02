{ inputs, ... }:

final: prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${prev.system}; #добавляем оверлей для стабильной ветки. Вызывается с помощью pkgs.stable
  hyprsession = inputs.hyprsession.packages.${prev.system}.hyprsession;
}
