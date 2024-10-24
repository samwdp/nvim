return {
    "ej-shafran/compile-mode.nvim",
    -- you can just use the latest version:
    -- branch = "nightly",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- if you want to enable coloring of ANSI escape codes in
        -- compilation output, add:
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()

        ---@type CompileModeOpts
        vim.g.compile_mode = {
            buffer_name="compilation",
            -- to add ANSI escape code support, add:
            baleia_setup = true,
        }

        vim.keymap.set("n", "<leader>cc", ":Compile<cr>", { desc = "[C]ode [C]ompile" })
        vim.keymap.set("n", "<F2>", ":Compile<cr>", { desc = "[C]ode [C]ompile" })
        vim.keymap.set("n", "<leader>cC", ":Recompile<cr>", { desc = "[C]ode [R]ecompile" })
        vim.keymap.set("n", "<F3>", ":Recompile<cr>", { desc = "[C]ode [R]ecompile" })
    end
}

