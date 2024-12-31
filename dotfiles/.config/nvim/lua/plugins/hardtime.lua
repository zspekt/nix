return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disabled_keys = { -- put keys here so hardtime won't get in the way
        -- ["<Up>"] = {},  
        -- ["<Down>"] = {},
        ["<Left>"] = {}, -- currently using these 2 to switch buffers
        ["<Right>"] = {},
      },
    },
    config = function (_, opts)
      require('hardtime').setup(opts)
    end
  },
}
