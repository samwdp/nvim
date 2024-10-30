local ose = require('omnisharp_extended')
vim.keymap.set("n", "gd",
    function()
        ose.telescope_lsp_definition()
    end,
    { buffer = 0, desc = "[G]oto [D]efinition (decompile)" })

vim.keymap.set("n", "gr",
    function()
        ose.telescope_lsp_references()
    end,
    { buffer = 0, desc = "[G]oto [R]eferences (decompile)" })

vim.keymap.set("n", "gt",
    function()
        ose.telescope_lsp_type_definition()
    end,
    { buffer = 0, desc = "[G]oto Type Definition (decompile)" })

vim.keymap.set("n", "gi",
    function()
        ose.telescope_lsp_implementation()
    end,
    { buffer = 0, desc = "[G]oto [I]mplementation (decompile)" })


-- vim.keymap.set("n", "gd", ":Telescope csharpls_definition<CR>", {})
-- vim.api.nvim_create_augroup("FileType", {
--   pattern = "cs",
--   callback = function () vim.keymap.set("n", "gd", ":Telescope csharpls_definition<CR>",{}) end,
-- })
