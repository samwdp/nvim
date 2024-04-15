vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = false

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Set the amount of columns for column line
vim.opt.colorcolumn = "80"

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>ww", vim.cmd.write, { desc = "Write File" })
vim.keymap.set("n", "<leader>wW", ":wq <CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Window Right" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Window Left" })
vim.keymap.set("n", "<C-L>", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<C-H>", ":tabprev<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>ws", ":vs<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>wd", ":wincmd q<CR>", { desc = "Delete window" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        {
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
        },
        {
            "dm1try/golden_size"
        },
        { "numToStr/Comment.nvim", opts = {} },
        { -- Adds git related signs to the gutter, as well as utilities for managing changes
            "lewis6991/gitsigns.nvim",
            opts = {
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            },
        },
        {                       -- Useful plugin to show you pending keybinds.
            "folke/which-key.nvim",
            event = "VimEnter", -- Sets the loading event to 'VimEnter'
            config = function() -- This is the function that runs, AFTER loading
                require("which-key").setup()

                -- Document existing key chains
                require("which-key").register({
                    ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                    ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
                    ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
                    ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
                    ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
                    ["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
                })
            end,
        },
        { -- Fuzzy Finder (files, lsp, etc)
            "nvim-telescope/telescope.nvim",
            event = "VimEnter",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                { -- If encountering errors, see telescope-fzf-native README for installation instructions
                    "nvim-telescope/telescope-fzf-native.nvim",

                    -- `build` is used to run some command when the plugin is installed/updated.
                    -- This is only run then, not every time Neovim starts up.
                    build = "make",

                    -- `cond` is a condition used to determine whether this plugin should be
                    -- installed and loaded.
                    cond = function()
                        return vim.fn.executable("make") == 1
                    end,
                },
                { "nvim-telescope/telescope-ui-select.nvim" },

                -- Useful for getting pretty icons, but requires a Nerd Font.
                { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
            },
            config = function()
                require("telescope").setup({
                    extensions = {
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown(),
                        },
                    },
                })
                -- Enable Telescope extensions if they are installed
                pcall(require("telescope").load_extension, "fzf")
                pcall(require("telescope").load_extension, "ui-select")

                -- See `:help telescope.builtin`
                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
                vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
                vim.keymap.set("n", "<leader>sf", builtin.git_files, { desc = "[S]earch [F]iles" })
                vim.keymap.set("n", "<leader>.", builtin.find_files, { desc = "[S]earch [F]iles" })
                vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[S]earch [F]iles" })
                vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
                vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
                vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
                vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
                vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
                vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
                vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
                vim.keymap.set('n', '<M-x>', builtin.commands, { desc = '[S]earch [C]ommands' })

                -- Slightly advanced example of overriding default behavior and theme
                vim.keymap.set("n", "<leader>/", function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end, { desc = "[/] Fuzzily search in current buffer" })

                -- It's also possible to pass additional configuration options.
                --  See `:help telescope.builtin.live_grep()` for information about particular keys
                vim.keymap.set("n", "<leader>s/", function()
                    builtin.live_grep({
                        grep_open_files = true,
                        prompt_title = "Live Grep in Open Files",
                    })
                end, { desc = "[S]earch [/] in Open Files" })

                -- Shortcut for searching your Neovim configuration files
                vim.keymap.set("n", "<leader>sn", function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end, { desc = "[S]earch [N]eovim files" })
            end,
        },
        "github/copilot.vim",
        { -- LSP Configuration & Plugins
            "neovim/nvim-lspconfig",
            dependencies = {
                -- Automatically install LSPs and related tools to stdpath for Neovim
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",

                -- Useful status updates for LSP.
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                { "j-hui/fidget.nvim", opts = {} },

                -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
                -- used for completion, annotations and signatures of Neovim apis
                { "folke/neodev.nvim", opts = {} },
            },
            config = function()
                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                    callback = function(event)
                        local opts = { buffer = event.buf }
                        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                        -- to define small helper and utility functions so you don't have to repeat yourself.
                        --
                        -- In this case, we create a function that lets us more easily define mappings specific
                        -- for LSP related items. It sets the mode, buffer and description for us each time.
                        local map = function(keys, func, desc)
                            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                        end
                        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

                        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                        map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                        map("gt", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                        map("<C-,>", vim.lsp.buf.code_action, "[C]ode [A]ction")
                        map("<leader>f", vim.lsp.buf.format, "[F]ormat Document")
                        map("K", vim.lsp.buf.hover, "Hover Documentation")
                        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                        local client = vim.lsp.get_client_by_id(event.data.client_id)
                        if client and client.server_capabilities.documentHighlightProvider then
                            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                                buffer = event.buf,
                                callback = vim.lsp.buf.document_highlight,
                            })

                            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                                buffer = event.buf,
                                callback = vim.lsp.buf.clear_references,
                            })
                        end
                    end,
                })

                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

                local servers = {
                    gopls = {},
                    tsserver = {},
                    omnisharp = {},
                    lua_ls = {
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        },
                    },
                }

                require("mason").setup()
                local ensure_installed = vim.tbl_keys(servers or {})
                vim.list_extend(ensure_installed, {
                    "stylua", -- Used to format Lua code
                })
                require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

                require("mason-lspconfig").setup({
                    handlers = {
                        function(server_name)
                            local server = servers[server_name] or {}
                            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
                                server.capabilities or {})
                            require("lspconfig")[server_name].setup(server)
                        end,
                    },
                })
            end,
        },
        { -- Autocompletion
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                {
                    "L3MON4D3/LuaSnip",
                    build = (function()
                        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                            return
                        end
                        return "make install_jsregexp"
                    end)(),
                    dependencies = {
                        -- `friendly-snippets` contains a variety of premade snippets.
                        --    See the README about individual language/framework/plugin snippets:
                        --    https://github.com/rafamadriz/friendly-snippets
                        -- {
                        --   'rafamadriz/friendly-snippets',
                        --   config = function()
                        --     require('luasnip.loaders.from_vscode').lazy_load()
                        --   end,
                        -- },
                    },
                },
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-cmdline",
            },
            config = function()
                -- See `:help cmp`
                local cmp = require("cmp")
                local luasnip = require("luasnip")
                luasnip.config.setup({})

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    completion = { completeopt = "menu,menuone,noinsert" },

                    mapping = cmp.mapping.preset.insert({
                        -- Select the [n]ext item
                        ["<C-n>"] = cmp.mapping.select_next_item(),
                        -- Select the [p]revious item
                        ["<C-p>"] = cmp.mapping.select_prev_item(),

                        -- Scroll the documentation window [b]ack / [f]orward
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),

                        -- Accept ([y]es) the completion.
                        --  This will auto-import if your LSP supports it.
                        --  This will expand snippets if the LSP sent a snippet.
                        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

                        -- Manually trigger a completion from nvim-cmp.
                        --  Generally you don't need this, because nvim-cmp will display
                        --  completions whenever it has completion options available.
                        ["<C-Space>"] = cmp.mapping.complete({}),

                        ["<C-l>"] = cmp.mapping(function()
                            if luasnip.expand_or_locally_jumpable() then
                                luasnip.expand_or_jump()
                            end
                        end, { "i", "s" }),
                        ["<C-h>"] = cmp.mapping(function()
                            if luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
                            end
                        end, { "i", "s" }),

                    }),
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "path" },
                    },
                })
            end,
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                local lualine = require("lualine")
                -- Color table for highlights
                -- stylua: ignore
                local colors = {
                    black        = '#282828',
                    white        = '#ebdbb2',
                    red          = '#fb4934',
                    green        = '#b8bb26',
                    blue         = '#83a598',
                    yellow       = '#fe8019',
                    gray         = '#a89984',
                    darkgray     = '#3c3836',
                    lightgray    = '#504945',
                    inactivegray = '#7c6f64',
                }

                local conditions = {
                    buffer_not_empty = function()
                        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                    end,
                    hide_in_width = function()
                        return vim.fn.winwidth(0) > 80
                    end,
                    check_git_workspace = function()
                        local filepath = vim.fn.expand("%:p:h")
                        local gitdir = vim.fn.finddir(".git", filepath .. ";")
                        return gitdir and #gitdir > 0 and #gitdir < #filepath
                    end,
                }

                -- Config
                local config = {
                    options = {
                        -- Disable sections and component separators
                        component_separators = "",
                        section_separators = "",
                        theme = {
                            -- We are going to use lualine_c an lualine_x as left and
                            -- right section. Both are highlighted by c theme .  So we
                            -- are just setting default looks o statusline
                            normal = { c = { fg = colors.fg, bg = colors.bg } },
                            inactive = { c = { fg = colors.fg, bg = colors.bg } },
                        },
                    },
                    sections = {
                        -- these are to remove the defaults
                        lualine_a = {},
                        lualine_b = {},
                        lualine_y = {},
                        lualine_z = {},
                        -- These will be filled later
                        lualine_c = {},
                        lualine_x = {},
                    },
                    inactive_sections = {
                        -- these are to remove the defaults
                        lualine_a = {},
                        lualine_b = {},
                        lualine_y = {},
                        lualine_z = {},
                        lualine_c = {},
                        lualine_x = {},
                    },
                }

                -- Inserts a component in lualine_c at left section
                local function ins_left(component)
                    table.insert(config.sections.lualine_c, component)
                end

                -- Inserts a component in lualine_x at right section
                local function ins_right(component)
                    table.insert(config.sections.lualine_x, component)
                end

                ins_left({
                    function()
                        return "▊"
                    end,
                    color = { fg = colors.blue },      -- Sets highlighting of component
                    padding = { left = 0, right = 1 }, -- We don't need space before this
                })

                ins_left({
                    -- mode component
                    function()
                        return ""
                    end,
                    color = function()
                        -- auto change color according to neovims mode
                        local mode_color = {
                            n = colors.red,
                            i = colors.green,
                            v = colors.blue,
                            [""] = colors.blue,
                            V = colors.blue,
                            c = colors.magenta,
                            no = colors.red,
                            s = colors.orange,
                            S = colors.orange,
                            [""] = colors.orange,
                            ic = colors.yellow,
                            R = colors.violet,
                            Rv = colors.violet,
                            cv = colors.red,
                            ce = colors.red,
                            r = colors.cyan,
                            rm = colors.cyan,
                            ["r?"] = colors.cyan,
                            ["!"] = colors.red,
                            t = colors.red,
                        }
                        return { fg = mode_color[vim.fn.mode()] }
                    end,
                    padding = { right = 1 },
                })

                ins_left({
                    -- filesize component
                    "filesize",
                    cond = conditions.buffer_not_empty,
                })

                ins_left({
                    "filename",
                    cond = conditions.buffer_not_empty,
                    color = { fg = colors.magenta, gui = "bold" },
                })

                ins_left({ "location" })

                ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

                ins_left({
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " " },
                    diagnostics_color = {
                        color_error = { fg = colors.red },
                        color_warn = { fg = colors.yellow },
                        color_info = { fg = colors.cyan },
                    },
                })

                -- Insert mid section. You can make any number of sections in neovim :)
                -- for lualine it's any number greater then 2
                ins_left({
                    function()
                        return "%="
                    end,
                })

                ins_left({
                    -- Lsp server name .
                    function()
                        local msg = "No Active Lsp"

                        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = " LSP:",
                    color = { fg = "#ffffff", gui = "bold" },
                })

                -- Add components to right sections
                ins_right({
                    "o:encoding",       -- option component same as &encoding in viml
                    fmt = string.upper, -- I'm not sure why it's upper case either ;)
                    cond = conditions.hide_in_width,
                    color = { fg = colors.green, gui = "bold" },
                })

                ins_right({
                    "fileformat",
                    fmt = string.upper,
                    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
                    color = { fg = colors.green, gui = "bold" },
                })

                ins_right({
                    "branch",
                    icon = "",
                    color = { fg = colors.violet, gui = "bold" },
                })

                ins_right({
                    "diff",
                    -- Is it me or the symbol for modified us really weird
                    symbols = { added = " ", modified = "󰝤 ", removed = " " },
                    diff_color = {
                        added = { fg = colors.green },
                        modified = { fg = colors.orange },
                        removed = { fg = colors.red },
                    },
                    cond = conditions.hide_in_width,
                })

                ins_right({
                    function()
                        return "▊"
                    end,
                    color = { fg = colors.blue },
                    padding = { left = 1 },
                })

                -- Now don't forget to initialize lualine
                lualine.setup(config)
            end,
        },
        {
            "samwdp/gruvbox.nvim",
            priority = 1000,
            config = function()
                -- Default options:
                require("gruvbox").setup({
                    terminal_colors = true, -- add neovim terminal colors
                    undercurl = true,
                    underline = true,
                    bold = true,
                    italic = {
                        strings = false,
                        emphasis = false,
                        comments = false,
                        operators = false,
                        folds = false,
                    },
                    strikethrough = true,
                    invert_selection = false,
                    invert_signs = false,
                    invert_tabline = false,
                    invert_intend_guides = false,
                    inverse = true, -- invert background for search, diffs, statuslines and errors
                    contrast = "",  -- can be "hard", "soft" or empty string
                    palette_overrides = {},
                    overrides = {},
                    dim_inactive = false,
                    transparent_mode = false,
                })
                vim.cmd.colorscheme("gruvbox")
            end,
        },
        {
            "folke/todo-comments.nvim",
            event = "VimEnter",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = { signs = false },
        },

        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",         -- required
                "sindrets/diffview.nvim",        -- optional - Diff integration
                "nvim-telescope/telescope.nvim", -- optional
            },
            config = function()
                vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>")
                require("neogit").setup({})
            end,
        },
        { -- Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            opts = {
                ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
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
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        },
        {
            "HiPhish/rainbow-delimiters.nvim"
        },
    }, {
        ui = {
            icons = vim.g.have_nerd_font and {} or {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
    })
