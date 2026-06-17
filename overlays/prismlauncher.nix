{ inputs, ... }:

final: prev: {
  prismlauncher-cracked = inputs.prismlauncher-cracked.packages.${prev.system}.prismlauncher;
  # prismlauncher-cracked = inputs.prismlauncher-cracked.packages.${prev.system}.default;
}
