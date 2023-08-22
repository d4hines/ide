{ pkgs }:
let
  plugins = import ../plugins.nix { inherit pkgs; };
  myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      packages.all.start = plugins;
      customRC = ''
        lua require("ayham").init()
      '';
    };
  };
in
  pkgs.writeShellApplication {
    name = "nvim";
    text = ''
      ${myNeovimUnwrapped}/bin/nvim "$@"
    '';
  }
