vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = "setlocal conceallevel=0"
})

vim.api.nvim_set_hl(0, "Visual", { bg = "#5B3960", fg = "NONE" })
