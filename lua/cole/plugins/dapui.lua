require('dap-go').setup()
require("dapui").setup()
local dap = require("dap")
local dui = require("dapui")

local cfg = {
    configurations = {
        -- C lang configurations
        c = {
            {
                name = "Launch debugger",
                type = "lldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                program = function()
                    -- Build with debug symbols
                    local out = vim.fn.system({"make", "debug"})
                    -- Check for errors
                    if vim.v.shell_error ~= 0 then
                        vim.notify(out, vim.log.levels.ERROR)
                        return nil
                    end
                    -- Return path to the debuggable program
                    return "path/to/executable"
                end,
            },
        },
        odin = {
            {
                name = "Debug Odin",
                type = "lldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                program = function()
                    -- Build with debug symbols
                    local out = vim.fn.system({"odin", "build", ".", "-debug", "./debug"})
                    -- Check for errors
                    if vim.v.shell_error ~= 0 then
                        vim.notify(out, vim.log.levels.ERROR)
                        return nil
                    end
                    -- Return path to the debuggable program
                    return "./debug"
                end,
            },
        },
    },
}

require('dap-lldb').setup(cfg)
vim.keymap.set('n', '<F5>', function()
    require('dap').continue()
    dui.open()
end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>dt', dui.toggle)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
