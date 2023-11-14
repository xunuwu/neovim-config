{
  description = "xun's neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem (
      system: let
        inherit (nixpkgs) lib;
        pkgs = nixpkgs.legacyPackages.${system};

        nvim =
          pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
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

                  git
                  # for telescope
                  ripgrep
                  fd

                  # toggleterm
                  gitui

                  # treesitter
                  tree-sitter
                  nodejs

                  # language servers
                  lua-language-server
                  rust-analyzer
                  nil
                  zls
                  clang-tools

                  # formatters
                  stylua
                  alejandra
                  rustfmt
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
