{pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme.enable = true;
          theme.name = "catppuccin";
          theme.style = "mocha";

          startPlugins = with pkgs.vimPlugins; [
            filetree
          ];
          languages.nix.enable = true;
          languages.clang.enable = true;
          languages.python.enable = true;
          languages.markdown.enable = true;
          languages.lua.enable = true;

        };
      };
    };
}
