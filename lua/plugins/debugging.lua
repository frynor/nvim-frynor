return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",  -- UI for DAP
    "nvim-neotest/nvim-nio",  -- Neotest integration (if needed)
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Define the GDB adapter
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }

    dapui.setup()

    -- DAP UI configuration
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Key mappings for DAP
    vim.keymap.set("n", "<Leader>d", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue Debugging" })
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate Debugging" })

    -- Debug configuration for C++ and C
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',  -- Current working directory
        stopOnEntry = false,         -- Change to true if you want to stop at the entry point
        args = {},                   -- Add any command-line arguments here
        runInTerminal = true,        -- Run in terminal if you want
      },
    }
    
    dap.configurations.c = dap.configurations.cpp  -- Use the same config for C
  end,
}

