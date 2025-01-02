local dap = require("dap")

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv("UserAppData") .. "/Local/nvim-data/mason/bin/firefox-debug-adapter.cmd" },
}

dap.configurations.typescript = {
    {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = function()
            return vim.fn.input('Path to executable: ', 'http://localhost:' .. vim.fn.getcwd())
        end,
        -- url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = "C:/Program Files/Zen Twilight/zen.exe"
    }
}
