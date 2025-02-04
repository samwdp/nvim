local dap = require("dap")

dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { vim.fn.stdpath('data') .. '/Local/nvim-data/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js' },
}

dap.configurations.typescript = {
    {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = function()
            return vim.fn.input('Web URL: ', 'http://localhost:')
        end,
        -- url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = "C:\\Program Files\\Zen Twilight\\zen.exe"
    }
}
