local set = vim.keymap.set

set('n', '<Esc>',  "<cmd> noh <CR>", { desc = "Clear highlights" })
set('n', '<C-c>',  "<cmd> %y+ <CR>", { desc = "Copy whole file" })
set('n', '<leader>tn',  "<cmd> set nu! <CR>", { desc = "Toggle line number" })
set('n', '<leader>trn',  "<cmd> set rnu! <CR>", { desc = "Toggle relative line number" })
