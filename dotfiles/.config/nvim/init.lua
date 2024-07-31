-- load options
require("config.opts")

-- load keymaps
require("config.keymaps")

-- Setup lazy.nvim
-- require("lazy").setup("plugins")
require("config.lazy")

vim.cmd [[colorscheme  kanagawa]]

-- TODO: OVERRIDE KANAGAWA'S COLORS THE PROPER WAY
vim.cmd [[hi NormalFloat guibg=NONE]]
vim.cmd [[hi FloatBorder guifg=#ff9e3b]]
vim.cmd [[hi FloatBorder guibg=NONE]]
vim.cmd [[hi TelescopeBorder guifg=#ff9e3b]]
vim.cmd [[hi TabLine guibg=NONE]]
vim.cmd [[hi TabLineFill guibg=NONE]]
vim.cmd [[hi TabLineSel guibg=NONE]]
vim.cmd [[hi TabLineSel guifg=#ff9e3b]]
