{pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme.enable = true;
          theme.name = "catppuccin";
          theme.style = "mocha";

          startPlugins = with pkgs.vimPlugins; [
            nvim-tree-lua
#             {
#                 plugin = nvim-tree-lua;
#                 config = builtins.readFile(./nvimPlugins/filetree.lua);
#             }
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
