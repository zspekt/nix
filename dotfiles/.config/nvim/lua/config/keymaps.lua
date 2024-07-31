local set = vim.keymap.set

set('i', '<up>', "<Nop>", {})
set('i', '<down>', "<Nop>", {})
set('i', '<left>', "<Nop>", {})
set('i', '<right>', "<Nop>", {})
set('i', '<C-h>', "<Nop>", {})
set('i', '<C-l>', "<Nop>", {})

set('n', '<Esc>', "<cmd> noh <CR>", { desc = "Clear highlights" })
set('n', '<C-c>', "<cmd> %y+ <CR>", { desc = "Copy whole file" })
-- set('n', '<leader>tn', "<cmd> set nu! <CR>", { desc = "Toggle line number" }) under what circumstances would you ever wanna disable this?
set('n', '<leader>trn', "<cmd> set rnu! <CR>", { desc = "Toggle relative line number" })

-- buffer navigation
set("n", "<right>", "<cmd> bnext <CR>", { desc = "Next buffer" })
set("n", "<left>", "<cmd> bprevious <CR>", { desc = "Previous buffer" })

-- tab navigation
set("n", "<Tab>", "<cmd> tabnext <CR>", { desc = "Next tab" })
set("n", "<S-Tab>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })
set("n", "<S-right>","<cmd> tabnext <CR>", { desc = "Next tab" })
set("n", "<S-left>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })


set("n", "<leader>tn", "<cmd> tabnew <CR>", { desc = "New tab" })
set("n", "<leader>tx", "<cmd> tabclose <CR>", { desc = "Close tab" })

set("n", "<leader>bx", "<cmd> bd <CR>", { desc = "Close buffer" })


set("n", "<leader>ggn", "<cmd> Neogit <CR>", { desc = "Open Neogit" })
set("n", "<leader>ggp", "<cmd> Neogit pull <CR>", { desc = "Neogit pull" })
set("n", "<leader>ggP", "<cmd> Neogit push <CR>", { desc = "Neogit push" })
set("n", "<leader>ggc", "<cmd> Neogit push <CR>", { desc = "Neogit push" })


-- QF navigation
set('n', '<leader>,', "<cmd> cprev <CR>", { desc = "Previous QF list element" })
set('n', '<leader>.', "<cmd> cnext <CR>", { desc = "Next QF list element" })

-- bind to delete element from QF list with x
vim.api.nvim_exec([[
  function! s:QfRemoveAtCursor() abort
    let currline = line('.')
    let items = getqflist()->filter({ index -> (index + 1) != currline })
    call setqflist(items, 'r')
    execute 'normal ' . currline . 'G'
  endfunction

  augroup quickfix
    autocmd!
    autocmd FileType qf nnoremap <buffer><silent> x :call <SID>QfRemoveAtCursor()<CR>
  augroup END
]], false)
