{
  description = "Personal Portable IDE flake.nix.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";

    telescope-recent-files-src = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
  };
  outputs = {
    self,
    nixpkgs,
    neovim,
    flake-utils,
    telescope-recent-files-src,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.${prev.system}.neovim;

        vimPlugins =
          final.vimPlugins
          // {
            ayham-nvim = import ./packages/myConfig.nix {
              src = ./ayham-nvim;
              pkgs = prev;
            };
            telescope-recent-files = import ./packages/vimPlugins/telescopeRecentFiles.nix {
              src = telescope-recent-files-src;
              pkgs = prev;
            };
          };
      };

      overlayMyNeovim = prev: final: {
        myNeovim = import ./packages/myNeovim.nix {
          pkgs = prev;
        };
      };

      pkgs = import nixpkgs {
        system = system;
        overlays = [overlayFlakeInputs overlayMyNeovim];
      };
    in {
      packages = rec {
        nvim = pkgs.myNeovim;
        default = nvim;
      };
      apps = rec {
        nvim = flake-utils.lib.mkApp {drv = self.packages.${system}.nvim;};
        default = nvim;
      };
    });
}
