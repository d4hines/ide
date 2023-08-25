{ pkgs }:
with pkgs; [
  lazygit
  rust-analyzer
  terraform-ls
  gopls
  haskell-language-server
  jsonnet-language-server
  lua-language-server
  nil
  ripgrep
  ccls
  clang
  clang-tools

  # formatters
  gofumpt
  golines
  nixpkgs-fmt
  python310Packages.black
  rustfmt

  # packages with results in /lib/node_modules/.bin must come at the end
  nodePackages."bash-language-server"
  nodePackages."diagnostic-languageserver"
  nodePackages."dockerfile-language-server-nodejs"
  nodePackages."pyright"
  nodePackages."typescript"
  nodePackages."typescript-language-server"
  nodePackages."vscode-langservers-extracted"
  nodePackages."yaml-language-server"
  nodePackages."markdownlint-cli"
]
