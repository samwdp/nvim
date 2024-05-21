local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()
require("neodev").setup()
require('dap-go').setup()
require("nvim-dap-virtual-text").setup()
require("custom.dap.netcordbg")
require("custom.dap.chrome")

vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint, { desc = "[T]oggle [B]reakpoint" })
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "[G]oto [B]reakpoint" })
vim.keymap.set("n", "<F5>", dap.continue, { desc = "continue" })
vim.keymap.set("n", "<F9>", dap.step_back, { desc = "step back" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "step into" })
vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    vim.g.focus_disable = true
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    vim.g.focus_disable = false
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    vim.g.focus_disable = false
    dapui.close()
end


-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
