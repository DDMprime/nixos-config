{ lib, config, ... }:

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
        zd = ''
            # Путь с директориями
            local DIR_FILE="$HOME/.config/fzf_dirs.txt"

            # Проверка существования файла
            if [[ ! -f "$DIR_FILE" ]]; then
            echo "Error: File $DIR_FILE not found"
            return 1
            fi

            # Выбор основной директории из файла
            local main_dir=$(cat "$DIR_FILE" | fzf \
            --height 100% \
            --reverse \
            --prompt="Main Directory> " \
            --preview-window "right,75%" \
            --preview "echo 'Content preview:' && exa -lha --group-directories-first --git --icons {1}")

            [[ -n "$main_dir" ]] || return  # Выход при отмене выбора

            # Переход в выбранную директорию
            cd "$main_dir" || return

            # Иерархический поиск поддиректорий
            local sub_dir=$(find . -type d -printf '%d\t%p\n' | \
            sort -n | \
            cut -f2- | \
            sed 's|^./||' | \
            fzf \
                --height 100% \
                --reverse \
                --prompt="Subdirectory> " \
                --preview "exa -lha --group-directories-first --git --icons {1}")

            [[ -n "$sub_dir" ]] && cd "$sub_dir" && ls -lh'';



      size = "du -achd 1 2>/dev/null | sort -hr | awk 'NR>1' | fzf --height 80% --reverse --preview 'echo {} | cut -f2 | xargs exa -lha --git --icons --group-directories-first' | cut -f2 | xargs realpath";
      nixreb = "sudo nixos-rebuild switch --flake .";
      o = ''selected=$(find . -maxdepth 1 -mindepth 1 -printf '%P\n' | awk '/^\..*/ {print "2" $0; next} {print "1" $0}' | sort -k1,1n -k2,2 | cut -c2- | fzf --preview 'if [ -d {} ]; then ls --color=auto {}; else bat --color=always --style=numbers {} 2>/dev/null || cat {}; fi') && if [[ -d "$selected" ]]; then cd "$selected" && echo "Переход в: $selected"; else xdg-open "$selected" &>/dev/null; fi'';

      };
    };
  };
}
