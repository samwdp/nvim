return {
    "samwdp/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
        vim.g.compiler_state = false
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            -- to add ANSI escape code support, add:
            baleia_setup = true,
            disable_swap = true,
        }

        vim.keymap.set("n", "<leader>cc", function()
            vim.api.nvim_command(":Compile")
            vim.g.compiler_state = true
        end, { desc = "[C]ode [C]ompile" })

        vim.keymap.set("n", "<F2>", function()
            if vim.g.compiler_state then
                vim.api.nvim_command(":Recompile")
            else
                vim.api.nvim_command(":Compile")
                vim.g.compiler_state = true
            end
        end, { desc = "[C]ode [C]ompile/Recompile" })
    end
}
