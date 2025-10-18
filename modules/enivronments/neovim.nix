{pkgs, ... }: {
  programs.nvf = {
  enable = true;

  settings.vim =
  {
      enableLuaLoader = true;
      viAlias = true; # алиас на вызов nvim - vi
      vimAlias = false;

      spellcheck = {
        enable = true;
        languages = [
          "en"
          "ru"
        ];
      };

      undoFile.enable = true;    # сохраняет историю изменений между сеансами

      searchCase = "smart";      # умный поиск (регистрозависимый только если есть заглавные буквы)

      options = {
          cursorlineopt = "line";
          shiftwidth = 2;
          scrolloff = 10;
        };

        lsp = {
          formatOnSave = false;
          lspkind.enable = false;
          lightbulb.enable = true; # max config
          lspsaga.enable = false;
          trouble.enable = true; # max config
          lspSignature.enable = true; # max config
          otter-nvim.enable = true;
          nvim-docs-view.enable = false;
        };

        debugger = {
          nvim-dap = {
            enable = true; # max config
            ui.enable = true;
            # sources = {
            #   java = "vscode-extensions.vscjava.vscode-java-pack";
            # };
          };
        };

        lsp.enable = true;
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          # Languages.
          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            treesitter.enable = true;
            format.type = "alejandra";
            lsp = {
              server = "nil";
              package = pkgs.nil;
            };
          };

          java.enable = false;
          csharp.enable = false;
          python.enable = true;
          yaml.enable = true;
          dart.enable = false;


          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
          };

          lua.enable = true;
          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          html.enable = true;
          php.enable = true;
          sql.enable = true;
          kotlin.enable = false;
          ts.enable = false;
          go.enable = false;
          zig.enable = false;
          typst.enable = false;
          rust = {
            enable = false;
            crates.enable = false;
          };
          assembly.enable = true;
          astro.enable = false;
          nu.enable = false;
          julia.enable = false;
          vala.enable = false;
          scala.enable = false;
          r.enable = false;
          gleam.enable = false;
          ocaml.enable = false;
          elixir.enable = false;
          haskell.enable = true;
          ruby.enable = false;
          fsharp.enable = false;

          tailwind.enable = false;
          svelte.enable = false;
        };

        visuals = {
          nvim-scrollbar.enable = false;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          cellular-automaton.enable = false;
        };

        statusline = {
          lualine = {
            enable = true;
            # theme = "iceberg_dark"; # "catppuccin";
          };
        };
        theme = {
          enable = true;
          name = "nord";
          style = "dark";
          transparent = true;
        };

        filetree.neo-tree.enable = true;

        startPlugins = [
          "base16"
          "catppuccin"
          "dracula"
          "everforest"
          "gruvbox"
          "nord"
          "onedark"
          "oxocarbon"
          "rose-pine"
          "solarized"
          "solarized-osaka"
          "tokyonight"
        ];

        autopairs.nvim-autopairs.enable = true; # закрывание скобок
        autocomplete.nvim-cmp.enable = true; # автодополнение
        tabline.nvimBufferline.enable = true;
        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
          hardtime-nvim = {
            enable = true;
            setupOpts = {
              max_count = 4;
              restriction_mode = "hint";
            };
          };
        };

        telescope.enable = true; # поиск по фаилу
        telescope.setupOpts.pickers.colorscheme.enable_preview = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        utility = {
          snacks-nvim.enable = true;
          nix-develop.enable = true;
          ccc.enable = false;
          vim-wakatime.enable = false;
          diffview-nvim.enable = true;
          yanky-nvim = {
            enable = true;
            setupOpts.ring.storage = "sqlite";
          };
          icon-picker.enable = true;
          surround = {
            enable = true;
            useVendoredKeybindings = false;
          };
          leetcode-nvim.enable = false;
          multicursors.enable = true;

          motion = {
            hop.enable = true;
            precognition.enable = false;
          };
          images = {
            image-nvim.enable = false;
          };
        };

        notes = {
          neorg = {
            enable = false;
            treesitter = {
              norgPackage = pkgs.vimPlugins.nvim-treesitter.grammarToPlugin pkgs.tree-sitter-grammars.tree-sitter-norg;
            };
          };
          orgmode.enable = false;
          todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = false;
          noice.enable = true;
          colorizer.enable = false;
          modes-nvim.enable = false; # bad
          illuminate.enable = true;
          breadcrumbs = {
            enable = false;
            navbuddy.enable = false;
          };
          smartcolumn = {
            enable = false;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = [
                "90"
                "130"
              ];
            };
          };
          fastaction.enable = true;
        };

        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = false;
            cmp.enable = false;
          };
          codecompanion-nvim.enable = false;
        };

        session = {
          nvim-session-manager = {
            enable = true;
            setupOpts = {
              autoload_mode = "CurrentDir";
              autosave_ignore_dirs = [
                "/home/ddm"
                "/home/ddm/Загрузки"
                #"/home/ddm/tmp"
              ];
            };
          };
        };

        gestures.gesture-nvim.enable = false;
        comments.comment-nvim.enable = true;
        presence.neocord.enable = true; # для интеграции в дискорд

        keymaps = [
          {
            key = "<C-l>";
            action = ":bp<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "<C-h>";
            action = ":bn<CR>";
            mode = "n";
            silent = true;
          }

          # Telescope
          {
            key = "ff";
            action = "<cmd>Telescope find_files<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "fg";
            action = "<cmd>Telescope live_grep<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "fb";
            action = "<cmd>Telescope buffers<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "fh";
            action = "<cmd>Telescope help_tags<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "gz";
            action = ":wq<CR>";
            mode = "n";
            silent = true;
          }
          {
            key = "ga";
            action = ":w<CR>";
            mode = "n";
            silent = true;
          }
        ];
    };
  };
}
