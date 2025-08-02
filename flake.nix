{
  description = "A flake for depenencies of this configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages =
        pkgs: with pkgs; [
          curl
          ripgrep

          # LSPs
          clang-tools
          rust-analyzer
          rustfmt
          gopls
          jdt-language-server
          kotlin-language-server
          arduino-language-server
          ghc
          haskell-language-server

          nil
          nixd
          bash-language-server
          hyprls

          postgres-lsp

          lua-language-server
          stylua
          pyright
          basedpyright
          dart

          typescript-language-server
          vscode-langservers-extracted
          superhtml
          htmx-lsp
          tailwindcss_4
          tailwindcss-language-server
          templ
          php84Packages.psalm
          phpactor
          svelte-language-server

          marksman
          tinymist
        ];
    in
    {
      home-manager-module =
        { pkgs, ... }:
        {
          programs.neovim.enable = true;
          home.packages = packages pkgs;
        };
      system-module =
        { pkgs, ... }:
        {
          programs.neovim.enable = true;
          environment.systemPackages = packages pkgs;
        };
      formatter.${system} = pkgs.nixfmt-tree;
    };
}
