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
    "rebelot/kanagawa.nvim", 
    lazy = false, 
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        }
      })
    end
  }
}
