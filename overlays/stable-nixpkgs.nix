{ inputs, ... }:
{
    nixpkgs.overlays =
        (final: prev: {
                    stable = inputs.nixpkgs-stable.legacyPackages.${prev.system}; #добавляем оверлей для стабильной ветки. Вызывается с помощью pkgs.stable
        });
}
