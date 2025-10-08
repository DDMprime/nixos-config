self: super: {
  nvidia-x11-custom = let
    generic = args:
      let
        imported = import "${super.path}/pkgs/os-specific/linux/nvidia-x11/generic.nix" args;
      in
      super.callPackage imported {
        lib32 = (super.pkgsi686Linux.callPackage imported {
          libsOnly = true;
          kernel = null;
        }).out;
      };
  in
    generic {
      version = "575.64.05";
      sha256_64bit = "sha256-hfK1D5EiYcGRegss9+H5dDr/0Aj9wPIJ9NVWP3dNUC0=";
      sha256_aarch64 = "sha256-GRE9VEEosbY7TL4HPFoyo0Ac5jgBHsZg9sBKJ4BLhsA=";
      openSha256 = "sha256-mcbMVEyRxNyRrohgwWNylu45R//KU=";
      settingsSha256 = "sha256-o2zUnYFUQjHOcCrB0w/4L6xI1hVUXLAWgG2Y26BowBE=";
      persistencedSha256 = "sha256-2g5z7Pu8u2EiAh5givP5Q1Y4zk4Cbb06W37rf768NFU=";
    };

  # Теперь добавим этот драйвер в nvidiaPackages
  linuxPackagesFor = super.linuxPackagesFor or (k: super.linuxPackagesFor k);
  linuxPackages = super.linuxPackages.extend (_self: _super: {
    nvidiaPackages = _super.nvidiaPackages // {
      myCustom = _super.nvidiaPackagesFor self.nvidia-x11-custom;
    };
  });
}
