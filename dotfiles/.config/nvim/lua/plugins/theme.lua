return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- }
  --
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  --
  {
    "zspekt/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true, -- NOTE: if using light mode, set this to false
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none" -- NOTE: if using light mode, do not set this
              }
            }
          }
        }
      })
      vim.cmd [[colorscheme  kanagawa]]
    end
  }
}
