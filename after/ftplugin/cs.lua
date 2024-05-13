local ose = require('omnisharp_extended')
vim.keymap.set("n", "<leader>gd",
    function()
        ose.telescope_lsp_definition()
    end,
    { buffer = 0, desc = "[G]oto [D]efinition (decompile)" })

vim.keymap.set("n", "<leader>gr",
    function()
        ose.telescope_lsp_references()
    end,
    { buffer = 0, desc = "[G]oto [R]eferences (decompile)" })

vim.keymap.set("n", "<leader>gt",
    function()
        ose.telescope_lsp_type_definition()
    end,
    { buffer = 0, desc = "[G]oto Type Definition (decompile)" })

vim.keymap.set("n", "<leader>gi",
    function()
        ose.telescope_lsp_implementation()
    end,
    { buffer = 0, desc = "[G]oto [I]mplementation (decompile)" })
