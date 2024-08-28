return {
  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- this closes the DAP ui once it's done executing. commented out
      --   dap.listeners.before.event_terminated["dapui_config"] = function()
      --     dapui.close()
      --   end
      --   dap.listeners.before.event_exited["dapui_config"] = function()
      --     dapui.close()
      --   end
    end,
  },
  -- nvim-dap-ui requires nvim-nio to be installed. Install from https://github.com/nvim-neotest/nvim-nio
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, opts)
      local set = vim.keymap.set
      set("n", "<F6>", "<cmd> DapStepOut <CR>")
      set("n", "<F7>", "<cmd> DapStepInto <CR>")
      set("n", "<F8>", "<cmd> DapStepOver <CR>")
      set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
      set("n", "<leader>dr", "<cmd> DapContinue <CR>")
      set("n", "<leader>dt", "<cmd> DapTerminate <CR>")
      set("n", "<leader>duc", function()
        require("dapui").close()
      end
      , { desc = "Close DapUI" }
      )
      set("n", "<leader>duo", function()
        require("dapui").open()
      end
      , { desc = "Close DapUI" }
      )
      set("n", "<leader>dus", function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end
      , { desc = "Open debugging sidebar" }
      )
    end,
  },
}
