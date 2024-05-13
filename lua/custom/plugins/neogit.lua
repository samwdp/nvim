return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",                 -- required
        "sindrets/diffview.nvim",                -- optional - Diff integration
        "nvim-telescope/telescope.nvim",         -- optional
    },
    config = function()
        vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>")
        require("neogit").setup({})
    end,
}
