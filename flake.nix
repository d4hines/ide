{
  description = "Personal Portable IDE flake.nix.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    neovim,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlay = prev: final: {
        neovim = neovim.packages.${prev.system}.neovim;

        vimPlugins =
          final.vimPlugins
          // {
            ayham-nvim = pkgs.vimUtils.buildVimPlugin {
              name = "ayham-nvim";
              version = "unstable";
              src = ./ayham-nvim;
            };
          };
      };

      pkgs = import nixpkgs {
        system = system;
        overlays = [overlay];
      };
      plugins = (import ./plugins.nix {inherit pkgs;});
      runtimeDeps = import ./runtimeDeps.nix {inherit pkgs;};
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
    in {
      packages = rec {
        nvim = pkgs.writeShellApplication {
          name = "nvim";
          runtimeInputs = [neovimRuntimeDependencies];
          text = ''
            ${myNeovimUnwrapped}/bin/nvim "$@"
          '';
        };
        default = nvim;
      };
      apps = rec {
        nvim = flake-utils.lib.mkApp {drv = self.packages.${system}.nvim;};
        default = nvim;
      };
    });
}
