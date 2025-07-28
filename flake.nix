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
          ripgrep

          # LSPs
          clang-tools
          rust-analyzer
          rustfmt
          gopls
          jdt-language-server
          kotlin-language-server
          pyright
          postgres-lsp
          arduino-language-server
          bash-language-server
          haskell-language-server
          ghc
          dart
          nil
          nixd
          hyprls
          # vscode-json-languageserver
          vscode-langservers-extracted
          superhtml
          htmx-lsp
          tailwindcss_4
          tailwindcss-language-server
          typescript-language-server
          php84Packages.psalm
          phpactor
          templ
          svelte-language-server
          lua-language-server
          stylua
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
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
