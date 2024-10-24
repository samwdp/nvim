local dap = require("dap")
dap.adapters.lldb = {
    type = 'executable',
    command = "C:\\Users\\sam\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe",
    name = 'lldb'
}
dap.configurations.odin = {
    {
        type = "lldb",
        name = "launch - gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    }
}
