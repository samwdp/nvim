return {
    {     -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "html", "lua", "markdown" },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-n>",
                    node_incremental = "<M-n>",
                    scope_incremental = "<M-e>",
                    node_decremental = "<M-p>",
                },
            },
        },
        config = function(_, opts)
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                textobjects = {
                    select = {
                        include_surrounding_whitespace = true,
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = { query = "@function.outer", desc = "Select outer function" },
                            ["if"] = { query = "@function.inner", desc = "Select inner function" },
                            ["ac"] = { query = "@class.inner", desc = "Select outer part of a class region" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        },
                    },
                },
            })
        end,
    },
}
