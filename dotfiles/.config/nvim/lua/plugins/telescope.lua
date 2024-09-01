return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  event = "VeryLazy",
  cmd = "Telescope",
  config = function()
    require("telescope").load_extension("persisted")
  end,
  init = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')
    wk.register({
      -- alternatively, you can call it without the function filter
      -- ["fd"] = { require('telescope.builtin').lsp_document_symbols(), "Find symbols" },

      ["fd"] = { function() require('telescope.builtin').lsp_document_symbols({ symbols = 'function' }) end, "Find functions" },
      ["fs"] = { "<cmd> Telescope persisted <CR>", "Find sessions" },
      ['/'] = { builtin.current_buffer_fuzzy_find, "Find in current buffer" },
      ['ff'] = { builtin.find_files, "Find File" },
      ['fo'] = { builtin.oldfiles, "Find previous files" },
      ['fa'] = { function()
        require('telescope.builtin').find_files({ hidden = true, no_ignore = true, })
      end, "Find all files" },
      ['fb'] = { builtin.buffers, "Find Buffer" },
      ['fw'] = { builtin.live_grep, "Find with Grep" },

      ['fg'] = { builtin.git_files, "Find Git tracked files" },
      ['fc'] = { builtin.git_commits, "Find Git commits" },
      ['gt'] = { builtin.git_status, "Git status" },

      ['fh'] = { builtin.help_tags, "Find Help" },
    }, { prefix = "<leader>" })
  end,
  opts = function()
    return {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        previewer = true,
        file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
      },
    }
  end,
}
