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
                let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'
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

                  # hex.nvim
                  xxd

                  # smart-open.nvim
                  sqlite
                  ripgrep

                  # misc
                  git

                  # mayb required for neorg??
                  lua51Packages.lua
                  lua51Packages.luarocks
                  unzip
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
          packages = with pkgs; [
            stylua
            lua-language-server
          ];
        };
      }
    );
}
