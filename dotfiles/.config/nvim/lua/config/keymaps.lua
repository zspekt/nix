local set = vim.keymap.set

set('n', '<Esc>',  "<cmd> noh <CR>", { desc = "Clear highlights" })
set('n', '<C-c>',  "<cmd> %y+ <CR>", { desc = "Copy whole file" })
set('n', '<leader>tn',  "<cmd> set nu! <CR>", { desc = "Toggle line number" })
set('n', '<leader>trn',  "<cmd> set rnu! <CR>", { desc = "Toggle relative line number" })

set('n', '<leader>,',  "<cmd> cprev <CR>", { desc = "Previous QF list element" })
set('n', '<leader>.',  "<cmd> cnext <CR>", { desc = "Next QF list element" })

-- Define the Vimscript function and autocommand in Lua
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

