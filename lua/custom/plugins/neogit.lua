return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    }

    -- {
    --     "tpope/vim-fugitive",
    --     config = function()
    --         vim.keymap.set('n', '<leader>gs', ':Git<CR>', {desc =  "[G]it [S]tatus"})
    --     end
    -- }
}
