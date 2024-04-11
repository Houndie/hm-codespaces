{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    unstable.rust-analyzer
    nodePackages.typescript-language-server
    lua-language-server
    nixd
    ruby-lsp
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs; [
      {
        plugin = vimPlugins.telescope-nvim;
        type = "lua";
        config = builtins.readFile(./telescope.lua);
      }

      {
        plugin = vimPlugins.nvim-lspconfig;
        type = "lua";
        config = builtins.readFile(./lspconfig.lua);
      }

      {
        plugin = vimPlugins.rust-tools-nvim;
        type = "lua";
        config = builtins.readFile(./rust-tools.lua);
      }

      # vimPlugins.cmp-nvim-lsp
      # vimPlugins.cmp-nvim-lua
      # vimPlugins.cmp-nvim-lsp-signature-help
      # vimPlugins.cmp-vsnip
      # vimPlugins.cmp-path
      # vimPlugins.cmp-buffer
      # vimPlugins.vim-vsnip

      #{
      #  plugin = vimPlugins.nvim-cmp;
      #  type = "lua";
      #  config = builtins.readFile(./cmp.lua);
      #}

      vimPlugins.nvim-treesitter.withAllGrammars

      {
        plugin = vimPlugins.nvim-treesitter;
        type = "lua";
        config = builtins.readFile(./treesitter.lua);
      }

      {
        plugin = vimPlugins.vimspector;
        type = "lua";
        config = builtins.readFile(./vimspector.lua);
      }

      vimPlugins.FixCursorHold-nvim
      vimPlugins.plenary-nvim
      vimPlugins.neotest-go

      {
        plugin = unstable.vimPlugins.neotest;
        type = "lua";
        config = builtins.readFile(./neotest.lua);
      }

      {
        plugin = vimPlugins.tokyonight-nvim;
	type = "lua";
	config = builtins.readFile(./tokyonight.lua);
      }

      vimPlugins.copilot-vim

    ];
  };
}
