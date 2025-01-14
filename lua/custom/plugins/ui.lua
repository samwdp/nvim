return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },
    {                       -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            local wk = require("which-key")

            -- Document existing key chains
            wk.add({
                { "<leader>c", group = "[C]ode" },
                { "<leader>d", group = "[D]ocument" },
                { "<leader>g", group = "[G]it" },
                { "<leader>h", group = "[H]arpoon" },
                { "<leader>i", group = "[I]nfo" },
                { "<leader>p", group = "[P]roject" },
                { "<leader>r", group = "[R]ename" },
                { "<leader>s", group = "[S]earch" },
                { "<leader>t", group = "[T]oggles" },
                { "<leader>v", group = "[V]ertical" },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
            highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    auto_open = { enabled = false }
                },
            },
            presets = {
                lsp_doc_border = true,
            },
            notify = {
                enabled = false,
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "nvim-focus/focus.nvim",
        config = function()
            require("focus").setup()
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s",          mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "<leader>sf", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",          mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
}
