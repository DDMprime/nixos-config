# overlays/yt-dlp-overlay.nix
final: prev: {
  # Переопределяем пакет yt-dlp
  yt-dlp = prev.stdenv.mkDerivation rec {
    pname = "yt-dlp";
    version = "2025.06.30"; # Используем версию из релизов

    src = prev.fetchurl {
      url = "https://github.com/yt-dlp/yt-dlp/releases/download/${version}/yt-dlp";
      sha256 = "sha256-KZpJqWBgYkOz5qV8yNFx6Yw+6j3cJQF946KPqTj4R4M="; # Хэш для версии 2025.06.30
    };

    dontUnpack = true; # Бинарник не нуждается в распаковке

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp $src $out/bin/yt-dlp
      chmod +x $out/bin/yt-dlp
      runHook postInstall
    '';

    doCheck = false; # Бинарник, проверки не нужны

    meta = with prev.lib; {
      description = "A youtube-dl fork with additional features and fixes";
      homepage = "https://github.com/yt-dlp/yt-dlp";
      license = licenses.unlicense; # yt-dlp использует Unlicense
      maintainers = [ ];
      platforms = platforms.linux ++ platforms.darwin; # yt-dlp работает на Linux и Darwin
    };
  };
}
