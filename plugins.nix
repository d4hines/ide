{ pkgs }:
with pkgs.vimPlugins; [
  nvim-lspconfig
  nvim-treesitter.withAllGrammars
  rust-tools-nvim

  # telescope
  plenary-nvim
  popup-nvim
  telescope-nvim

  # theme
  catppuccin-nvim

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
