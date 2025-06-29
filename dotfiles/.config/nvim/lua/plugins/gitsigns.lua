return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)

      local gitsigns = require('gitsigns')
      -- Navigation
      vim.keymap.set('n', ']g', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']g', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end, { desc = 'Next hunk' })

      vim.keymap.set('n', '[g', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[g', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end, { desc = 'Prev hunk' })

      -- Actions
      vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

      vim.keymap.set('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Stage hunk' })

      vim.keymap.set('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Reset hunk' })

      vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
      vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
      vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

      vim.keymap.set('n', '<leader>gb', function()
        gitsigns.blame_line({ full = true })
      end, { desc = 'Blame line' })

      vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff this file against Index' })

      vim.keymap.set('n', '<leader>gD', function()
        gitsigns.diffthis('~')
      end, { desc = 'Diff this file with its HEAD' })

      vim.keymap.set('n', '<leader>gQ', function() gitsigns.setqflist('all') end,
        { desc = 'Set quickfix list for all hunks' })
      vim.keymap.set('n', '<leader>gq', gitsigns.setqflist, { desc = 'Set quickfix list' })

      -- Toggles
      vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
      vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

      -- Text object
      vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select hunk' })
    end,
  },
}
