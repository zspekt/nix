local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    -- go
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,

    -- js/ts
    null_ls.builtins.formatting.biome,

    -- zsh
    null_ls.builtins.formatting.beautysh,

    -- sql
    null_ls.builtins.formatting.pg_format,

    -- dockerfile (not compose)
    null_ls.builtins.diagnostics.hadolint,

    -- misc
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "html", "json", "yaml", "markdown", "css" },
    },

    -- nix
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.diagnostics.statix,
    null_ls.builtins.code_actions.statix,
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
