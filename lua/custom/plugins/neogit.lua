return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', '<leader>gs', ':Git<CR>', {desc =  "[G]it [S]tatus"})
        end
    }
}
