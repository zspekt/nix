-- load options
require("config.opts")

-- load keymaps
require("config.keymaps")

-- Setup lazy.nvim
-- require("lazy").setup("plugins")
require("config.lazy")

vim.cmd [[colorscheme  kanagawa]]
