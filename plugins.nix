{pkgs}:
with pkgs.vimPlugins; [
  vim-fugitive 
  vim-rhubarb 
  vim-sleuth
  diffview-nvim

  fidget-nvim 
  neodev-nvim
  luasnip

  which-key-nvim 
  gitsigns-nvim

  catppuccin-nvim
  lualine-nvim 
 
  indent-blankline-nvim
  comment-nvim 
 
  telescope-nvim
  plenary-nvim
  telescope-fzf-native-nvim 

  nvim-treesitter.withAllGrammars
  nvim-treesitter-textobjects 
  
  # cmp
  nvim-lspconfig
  nvim-cmp
  cmp_luasnip 
  cmp-nvim-lsp
  lspkind-nvim
  cmp-buffer 
  
  # my config
  d4hines-nvim
]
