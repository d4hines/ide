{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "ayham-nvim";
  version = "unstable";
  inherit src;
}
