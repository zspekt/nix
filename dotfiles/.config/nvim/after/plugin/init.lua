vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

vim.cmd [[colorscheme  kanagawa]]
