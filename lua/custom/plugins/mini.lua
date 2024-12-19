return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.surround').setup()
            require('mini.bufremove').setup()
            vim.keymap.set("n", "<leader>db", function()
                MiniBufremove.delete()
            end, { desc = "[D]elete [B]uffer" })
        end,
    },
}
