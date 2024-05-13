return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
            { desc = "Add current file to Harpoon" })
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Toggle Harpoon" })

        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end, { desc = "Select Harpoon item 1" })
        vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end, { desc = "Select Harpoon item 2" })
        vim.keymap.set("n", "<C-o>", function() harpoon:list():select(3) end, { desc = "Select Harpoon item 3" })
        vim.keymap.set("n", "<C-i>", function() harpoon:list():select(4) end, { desc = "Select Harpoon item 4" })
    end
}
