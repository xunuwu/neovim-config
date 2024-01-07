{
  description = "xun's neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    ...
  } @ inputs:
    utils.lib.eachDefaultSystem (
      system: let
        inherit (nixpkgs) lib;
        pkgs = nixpkgs.legacyPackages.${system}.extend inputs.neovim-nightly-overlay.overlay;

        nvim =
          pkgs.wrapNeovimUnstable pkgs.neovim-nightly
          (pkgs.neovimUtils.makeNeovimConfig
            {
              customRC = ''
                set runtimepath^=${./.}
                source ${./.}/init.lua
              '';
            }
            // {
              wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${lib.makeBinPath (with pkgs; [
                  # for treesitter and prob others idk
                  gcc

                  # for telescope
                  ripgrep
                  fd

                  # treesitter
                  tree-sitter
                  nodejs

                  # misc
                  git
                ])}"
              ];
            });
      in {
        overlays = {
          neovim = _: _prev: {
            neovim = nvim;
          };
          default = self.overlays.neovim;
        };

        packages = rec {
          neovim = nvim;
          default = neovim;
        };

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.stylua
          ];
        };
      }
    );
}
