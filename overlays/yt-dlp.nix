final: prev: {
  yt-dlp = prev.stdenv.mkDerivation rec {
    pname = "yt-dlp";
    version = "2025.10.22";

    src = prev.fetchurl {
      url = "https://github.com/yt-dlp/yt-dlp/releases/download/${version}/yt-dlp";
      sha256 = "/ZlodkU0AWMJTYshOQxZECkA8+e83R/AESYiv3KYnU8=";
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
