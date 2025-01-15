return {
    "samwdp/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
        vim.g.compiler_state = false
        local compile_funcs = require("custom.compiler")

        ---@type CompileModeOpts
        vim.g.compile_mode = {
            baleia_setup = true,
            disable_swap = true,
            shell = "cmd.exe",
            default_command = compile_funcs.compile_command(),
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
    end,
}
