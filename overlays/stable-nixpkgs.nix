{ inputs, ... }:

final: prev: {
    stable = inputs.nixpkgs-stable.legacyPackages.${prev.system}; #добавляем оверлей для стабильной ветки. Вызывается с помощью pkgs.stable
    steam-run = prev.steam-run.override {
      extraPkgs = pkgs: [ pkgs.noto-fonts ];
    };
}
