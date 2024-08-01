return {
  {
    -- cool cursor effect when switching windows/doing long jumps
    "danilamihailov/beacon.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      speed = 1, -- too slow at 1, but too fast at 2
    },
  },
}
