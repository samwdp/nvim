return {
    {
        'LhKipp/nvim-nu',
        dependencies = {
            "nvimtools/none-ls.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        build = ':TSInstall nu',
        opts = {}
    }
}
