{ pkgs, unstable, ... }:
{
  # langs, linters, formatters, lsps, etc
  environment.systemPackages = with pkgs; [
    # nix
    nil
    alejandra
    nixfmt-rfc-style
    statix

    # go
    unstable.go
    unstable.gopls
    unstable.gofumpt
    unstable.goimports-reviser
    unstable.golines
    unstable.gotools
    unstable.delve
    # unstable.gdlv GUI frontend for delve

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
    shellharden
    unstable.bash-language-server

    # sql
    sqlfluff

    # css
    # vscode-langservers-extracted # alternative?
    # css-lsp not available
    stylelint

    # c
    # clang-format # not available
    ccls
    rocmPackages_5.llvm.clang-unwrapped

    # yaml
    yaml-language-server

    # misc
    gcc
    nodePackages.prettier
  ];
}
