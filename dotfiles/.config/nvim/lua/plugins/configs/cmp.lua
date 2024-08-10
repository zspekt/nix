local cmp = require "cmp"

local ls = require "luasnip"

local lspkind = require "lspkind"
lspkind.init {}

local options = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },

  completion = {
    completeopt = "menu,menuone,noselect",
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-D>"] = cmp.mapping.scroll_docs(-4),
    ["<C-F>"] = cmp.mapping.scroll_docs(4),

    ["<C-J>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-K>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-L>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
    ["<C-H>"] = cmp.mapping.complete(),

    ["<C-E>"] = cmp.mapping.close(),
  },
}

vim.keymap.set({ "i", "s" }, "<C-S-K>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true }
)

vim.keymap.set({ "i", "s" }, "<C-S-J>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true }
)

return options
