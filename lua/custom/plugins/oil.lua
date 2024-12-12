return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-p>"] = false,
                ["gp"] = "actions.preview",
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", "<cmd>Oil<CR>")
        vim.keymap.set("n", "<leader>pv", require("oil").toggle_float)
    end,
}
