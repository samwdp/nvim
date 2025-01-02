vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
        map("<leader>cs", vim.lsp.buf.signature_help, "[C]ode [S]ignatures")
        map("S", vim.lsp.buf.signature_help, "[C]ode [S]ignatures")

        map("<leader>f", vim.lsp.buf.format, "[F]ormat Document")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = ""
                }
            },
            virtual_text = {
                severity = "ERROR"
            },
        })

        if vim.lsp.inlay_hint then
            vim.keymap.set("n", "<leader>ih", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { buffer = event.buf, desc = "Toggle [I]nlay [H]int" })
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            vim.api.nvim_set_hl(0, "LspInlayHint", { fg = require('gruvbox').palette.dark4 })
        end
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

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
    html = {
        filetypes = { "html", "templ" }
    },
    ols = {},
    gopls = {
        settings = {
            gopls = {
                ["ui.inlayhint.hints"] = {
                    copositeLiteralFields = true,
                    constantValues = true,
                    parameterNames = true,
                },
            },
        },
    },
    ts_ls = {
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayVariableTypeHints = true,

                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
                hint = {
                    enable = true,
                },
            },
        },
    },
    rust_analyzer = {},
    sqlls = {},
}


require("mason").setup({
    registries = { "github:mason-org/mason-registry", 'github:crashdummyy/mason-registry', },
    ui = {
        border = "rounded",
    },
})
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    "stylua", -- Used to format Lua code
    "roslyn", -- Used to format Lua code
    "rzls",   -- Used to format Lua code
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
