{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "ayham-nvim";
  inherit src;
}
