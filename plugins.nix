{ pkgs }:
with pkgs.vimPlugins; [
  nvim-lspconfig
  nvim-treesitter.withAllGrammars
  rust-tools-nvim
  nvim-dap
  luasnip
  nvim-autopairs

  # cmp
  nvim-cmp
  cmp-buffer
  cmp-nvim-lsp
  cmp-path
  cmp-nvim-lua
  cmp-cmdline
  cmp-calc
  cmp-emoji
  cmp-spell

  # telescope
  plenary-nvim
  popup-nvim
  telescope-nvim
  telescope-recent-files
  telescope-fzy-native-nvim
  telescope-dap-nvim

  # theme
  gruvbox

  # floaterm
  vim-floaterm

  # extras
  gitsigns-nvim
  lualine-nvim
  nerdcommenter
  noice-nvim
  nui-nvim
  nvim-colorizer-lua
  nvim-notify
  nvim-treesitter-context
  nvim-ts-rainbow2
  nvim-web-devicons

  # my config
  ayham-nvim
]
