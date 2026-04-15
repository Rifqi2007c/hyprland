{ pkgs, lib, self, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    opts = {
      number = true;
      relativenumber = true;
    };

    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      colorizer.enable = true;
      bufferline.enable = true;
      nvim-tree.enable = true;
      noice.enable = true;
      rainbow-delimiters.enable = true;

      indent-blankline = {
        enable = true;
        indent = {
          char = "|";
      	};
      };

      snacks = {
        enable = true;
        settings = {
      	  indent = {
            enable = true;
      	    char = "|";
      	    only_scope = true;
      	    hl = "SnacksIndent";
      	  };
      	};
      };
    };

    plugins.lsp = {
      tsserver.enable = true;
      lua-ls.enable = true;
      lsp.server.cssls = true;
    };
        nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "luasnip";}
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
          modes = [ "i" "s" ];
        };
      };
    };
  };
}
