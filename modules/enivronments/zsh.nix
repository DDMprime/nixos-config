{ lib, config, pkgs, ... }:

{

  options = {
    zsh.enable =
      lib.mkEnableOption "enables zsh";
  };


  config = lib.mkIf config.zsh.enable {

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [ "git" "sudo" "systemd" ];
        };

        shellAliases = {
        g = "git";
        gs = "git status";
        gp = "git push";
        gl = "git log";
        sl = "ls";
        #tm = "tmux";
        l = "ls -l";
        ll = "ls -lh";
        la = "ls -alh";
        cl = "clear";
        lla = "ls -alh";
        ff = "fastfetch";
        nixreb = "sudo nixos-rebuild switch --flake .";
        o = ''selected=$(find . -maxdepth 1 -mindepth 1 -printf '%P\n' | awk '/^\..*/ {print "2" $0; next} {print "1" $0}' | sort -k1,1n -k2,2 | cut -c2- | fzf --preview 'if [ -d {} ]; then ls --color=auto {}; else bat --color=always --style=numbers {} 2>/dev/null || cat {}; fi') && if [[ -d "$selected" ]]; then cd "$selected" && echo "Переход в: $selected"; else xdg-open "$selected" &>/dev/null; fi'';
      };

    };
    users.defaultUserShell = pkgs.zsh;
  };
}
