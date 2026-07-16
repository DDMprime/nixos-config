final: prev: {
  steam-run = prev.buildFHSUserEnv {
    name = "steam-run";
    targetPkgs = pkgs:
      (prev.steam-run.targetPkgs or (pkgs: [])) pkgs
      ++ [ pkgs.noto-fonts ];
    # остальные параметры можно забрать из оригинального steam-run, если они экспортируются.
    # но для надёжности лучше задать явно:
    multiPkgs = pkgs: [ pkgs.fontconfig ];
    runScript = "bash";
    # можно добавить passthru, если это важно для других пакетов
  } // (prev.steam-run.passthru or {});
}
