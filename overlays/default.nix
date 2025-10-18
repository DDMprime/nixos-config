{ inputs, ... }:

{
  config.nixpkgs.overlays = [
    (import ./stable-nixpkgs.nix { inherit inputs; })
    (import ./yt-dlp.nix)
  ];
}
