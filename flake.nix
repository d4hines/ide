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
            ayham-nvim = import ./packages/myConfig.nix {
              src = ./ayham-nvim;
              pkgs = prev;
            };
          };
      };

      pkgs = import nixpkgs {
        system = system;
        overlays = [overlay];
      };
    in {
      packages = rec {
        nvim = import ./packages/myNeovim.nix {
          inherit pkgs;
        };
        default = nvim;
      };
      apps = rec {
        nvim = flake-utils.lib.mkApp {drv = self.packages.${system}.nvim;};
        default = nvim;
      };
    });
}
