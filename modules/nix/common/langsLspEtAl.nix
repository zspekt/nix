{ pkgs, ... }:
{
  # langs, linters, formatters, lsps, etc
  environment.systemPackages = with pkgs; [
    # nix
    nil
    alejandra
    nixfmt-rfc-style
    statix

    # go
    go
    gopls
    gofumpt
    goimports-reviser
    golines

    # lua
    stylua
    lua54Packages.luacheck
    lua51Packages.lua
    lua53Packages.lua
    lua-language-server
    luarocks

    # rust
    cargo
    rustc

    # python
    python3
    black
    mypy
    ruff
    pyright
    # debugpy // who needs debuggers anyways

    # js
    biome
    pkgs.nodePackages.typescript-language-server
    # js-debug-adapter

    # shell
    shfmt
    shellcheck
    beautysh

    # sql
    sqlfluff

    # css
    # vscode-langservers-extracted # alternative?
    # css-lsp not available
    stylelint

    # c
    # clang-format not available

    # misc
    gcc
    nodePackages.prettier
  ];
}
