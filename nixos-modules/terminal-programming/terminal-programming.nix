{...} : {
  programs.tmux = {
    enable = true;
  };

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        lsp = {
          enable = true;

          lspkind.enable = false;
          lightbulb.enable = true;
          lspsaga.enable = false;
          trouble.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          rust.enable = true;
          clang.enable = true;
          assembly.enable = true;
          lua.enable = true;

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

        autocomplete = {
          blink-cmp.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
      };
    };
  };
}