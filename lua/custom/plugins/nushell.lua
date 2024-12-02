return {
    {
        'LhKipp/nvim-nu',
        dependencies = {
            "nvimtools/none-ls.nvim",
        },
        build = ':TSInstall nu',
        opts = {}
    }
}
