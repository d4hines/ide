{ pkgs }:
let
  plugins = import ../plugins.nix { inherit pkgs; };
  runtimeDeps = import ../runtimeDeps.nix { inherit pkgs; };
  neovimRuntimeDependencies = pkgs.symlinkJoin {
    name = "neovimRuntimeDependencies";
    paths = runtimeDeps;
    postBuild = ''
      for f in $out/lib/node_modules/.bin/*; do
        path="$(readlink --canonicalize-missing "$f")"
        ln -s "$path" "$out/bin/$(basename $f)"
      done
      '';
  };
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
    runtimeInputs = [ neovimRuntimeDependencies ];
    text = ''
      ${myNeovimUnwrapped}/bin/nvim "$@"
    '';
  }
