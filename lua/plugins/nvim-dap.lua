-- debugger
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      {
        "Weissle/persistent-breakpoints.nvim",
        config = function()
          require("persistent-breakpoints").setup({
            load_breakpoints_event = { "BufReadPost" },
          })
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")
      local pb_api = require("persistent-breakpoints.api")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      -- Installed debugpy with pipx and use this to launch debugger.
      -- This ensures that we do not have to install debugpy in each venv.
      dap_python.setup("~/.local/pipx/venvs/debugpy/bin/python")

      dap_python.test_runner = "pytest"

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Eval var under cursor: This opens a small interface with
      -- all values of the object under the cursor
      vim.keymap.set("n", "d?", function()
        dapui.eval(nil, { enter = true })
      end)

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Toggle breakpoint
      vim.keymap.set("n", "<leader>db", function()
        pb_api.toggle_breakpoint()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Toggle [B]reakpoint" })

      vim.keymap.set("n", "<leader>dx", function()
        pb_api.clear_all_breakpoints()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Clear All Breakpoints" })

      -- Continue / Start
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, { noremap = true, silent = true, desc = "[D]ebugger: [C]ontinue" })

      -- Step Over
      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Step [O]ver" })

      -- Step Into
      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Step [I]nto" })

      -- Step Out
      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Step [O]ut" })

      -- Keymap to terminate debugging
      vim.keymap.set("n", "<leader>dq", function()
        require("dap").terminate()
      end, { noremap = true, silent = true, desc = "[D]ebugger: [Q]uit / Terminate" })

      -- Toggle DAP UI
      vim.keymap.set("n", "<leader>dui", function()
        dapui.toggle()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Toggle [UI]" })

      -- Debug Test Method
      vim.keymap.set("n", "<leader>dtm", function()
        dap_python.test_method()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Debug [T]est [M]ethod" })

      -- Debug Test Class
      vim.keymap.set("n", "<leader>dtc", function()
        dap_python.test_class()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Debug [T]est [C]lass" })

      -- Debug Python File
      vim.keymap.set("n", "<leader>df", function()
        dap_python.debug_file()
      end, { noremap = true, silent = true, desc = "[D]ebugger: Debug [F]ile" })
    end,
  },
}
