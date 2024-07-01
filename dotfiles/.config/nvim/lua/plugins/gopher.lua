return {
  {
    "olexsmir/gopher.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function()
      require("gopher").setup()
      local wk = require("which-key")
      wk.register({
        g = {
          s = {
            name = "Struct Tags",
            j = { "<cmd>GoTagAdd json<CR>", "Add json struct tags" },
            y = { "<cmd>GoTagAdd yaml<CR>", "Add yaml struct tags" },
          },
          a = {
            name = "Add",
            i = { "<cmd>GoIfErr<CR>", "Add if != err statement" },
          },
        },
      }, { prefix = "<leader>" })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
