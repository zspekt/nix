return {
  {
    "msvechla/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      vim.keymap.set('n', '<leader>fy', '<cmd> Telescope yaml_schema <CR>', { desc = "Pick Yaml Schema" })
    end,
  }
}
