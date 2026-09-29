{pkgs, ...} : {
  programs.tmux = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    tree-sitter

    # cmake-language-server
    # rust-analyzer
    # clang-tools
    # ols
    # asm-lsp
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {

        startPlugins = [
          (pkgs.vimUtils.buildVimPlugin {
            pname = "gruber-darker.vim";
            version = "v1.0.7";
            src = pkgs.fetchFromGitHub {
              owner = "ThunderBoltCODMYT";
              repo = "gruber-darker.vim";
              rev = "22dbf46d8a1925b2021476761bf11d8e3e70fe5c";
              sha256 = "sha256-rAB6F7mSsouw8OUQp/PMjLamG+quPZDRkKkRjIXxXsY=";
            };
          })
        ];

        luaConfigRC.gruber-darker = ''
          vim.cmd('colorscheme gruber-darker')
        '';

        viAlias = false;
        vimAlias = true;

        options = {
          tabstop = 4;
          shiftwidth = 4;
          expandtab = true;
        };

        # lsp = {
        #   enable = true;

        #   lspkind.enable = false;
        #   lightbulb.enable = true;
        #   lspsaga.enable = false;
        #   trouble.enable = true;
        # };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        # theme = {
        #   enable = true;
        #   name = "gruber-darker";
        #   transparent = false;
        # };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          rust = {
            enable = true;
            # Can only be enabled if lsp.enable = false
            extensions.rustaceanvim.enable = false;
            extensions.crates-nvim.enable = true;
          };
          clang.enable = true;
          assembly.enable = true;
          lua.enable = true;
          odin.enable = true;

          cmake.enable = true;

          markdown.enable = true;
          json.enable = true;
          toml.enable = true;
          yaml.enable = true;
          xml.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;

        telescope.enable = true;

        snippets.luasnip.enable = true;

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          blink-indent.enable = true;
          indent-blankline.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;

            integrations.breadcrumbs = {
              nvim-navic.enable = true;
              navbuddy.enable = true;
              lspsaga.enable = false;
            };
          };
        };

        autocomplete = {
          blink-cmp.enable = true;
        };

        treesitter.context.enable = true;

        tabline = {
          nvimBufferline.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        utility = {
          motion = {
            hop.enable = true;
            leap.enable = true;
            # precognition.enable = true;
          };
          oil-nvim = {
            enable = true;
            gitStatus.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          dropbar-nvim.enable = false;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;

          hardtime-nvim = {
            enable = true;

            setupOpts = {
              max_count = 5;
              restriction_mode = "hint_and_block";
              disable_mouse = true;
            };
          };
        };
      };
    };
  };
}