return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  init = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')
    wk.register({
      ["fs"] = { "<cmd> Telescope persisted <CR>", "Find sessions" },
      ['fz'] = { builtin.current_buffer_fuzzy_find, "Find in current buffer" },
      ['ff'] = { builtin.find_files, "Find File" },
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
