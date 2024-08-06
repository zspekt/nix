return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        default_file_explorer = true,
        columns = {
          "icon",
        },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
          -- [""] = ,
        },
        view_options = {
          show_hidden = true,
        },
      }
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  
  },
}
