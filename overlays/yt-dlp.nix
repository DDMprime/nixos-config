final: prev: {
  yt-dlp = prev.stdenv.mkDerivation rec {
    pname = "yt-dlp";
    version = "2025.10.14";

    src = prev.fetchurl {
      url = "https://github.com/yt-dlp/yt-dlp/releases/download/${version}/yt-dlp";
      sha256 = "104d8103f871fe5f165a945ab82884fa4f34007a8ab0d377fbad54482b6e0b68";
    };

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp $src $out/bin/yt-dlp
      chmod +x $out/bin/yt-dlp
      runHook postInstall
    '';

    doCheck = false;

    meta = with prev.lib; {
      description = "A youtube-dl fork with additional features and fixes";
      homepage = "https://github.com/yt-dlp/yt-dlp";
      license = licenses.unlicense;
      maintainers = [ ];
      platforms = platforms.linux ++ platforms.darwin;
    };
  };
}
