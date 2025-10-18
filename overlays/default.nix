{ inputs, ... }:

{
  config.nixpkgs.overlays = [
    (import ./stable-nixpkgs.nix ./yt-dlp.nix { inherit inputs; })
  ];
}
