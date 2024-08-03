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

-- buffers
set("n", "<right>", "<cmd> bnext <CR>", { desc = "Next buffer" })
set("n", "<left>", "<cmd> bprevious <CR>", { desc = "Previous buffer" })
set("n", "<leader>bd", "<cmd> bd <CR>", { desc = "Close buffer" })
set("n", "<leader>bD", "<cmd> bd! <CR>", { desc = "Close buffer with unsaved changes" })

-- tabs
set("n", "<Tab>", "<cmd> tabnext <CR>", { desc = "Next tab" })
set("n", "<S-Tab>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })

set("n", "<S-right>", "<cmd> tabnext <CR>", { desc = "Next tab" })
set("n", "<S-left>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })
set("n", "<leader>tn", "<cmd> tabnew <CR>", { desc = "New tab" })
set("n", "<leader>td", "<cmd> tabclose <CR>", { desc = "Close tab" })

-- Neogit
set("n", "<leader>ggn", "<cmd> Neogit <CR>", { desc = "Neogit" })
set("n", "<leader>ggp", "<cmd> Neogit pull <CR>", { desc = "Neogit pull" })
set("n", "<leader>ggP", "<cmd> Neogit push <CR>", { desc = "Neogit push" })
set("n", "<leader>ggc", "<cmd> Neogit commit <CR>", { desc = "Neogit commit" })

-- QF navigation
set('n', '<leader>,', "<cmd> cprev <CR>", { desc = "Previous QF list element" })
set('n', '<leader>.', "<cmd> cnext <CR>", { desc = "Next QF list element" })

-- resizing splits
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-u>", "<c-w>-")
set("n", "<M-d>", "<c-w>+")

-- https://www.reddit.com/r/neovim/comments/vlc9sc/how_to_define_a_user_command_to_partially_stage
local function gitsigns_visual_op(op)
  return function()
    return require('gitsigns')[op]({ vim.fn.line("."), vim.fn.line("v") })
  end
end

set('v', '<leader>ghs', gitsigns_visual_op"stage_hunk", { desc = "Stage visual selection" })

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
