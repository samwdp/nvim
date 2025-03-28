local on_attach = function(client, bufnr)
    -- -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- -- to define small helper and utility functions so you don't have to repeat yourself.
    -- --
    -- -- In this case, we create a function that lets us more easily define mappings specific
    -- -- for LSP related items. It sets the mode, buffer and description for us each time.
    -- local map = function(keys, func, desc)
    --     vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    -- end
    --
    -- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    -- map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
    -- map("<leader>cs", vim.lsp.buf.signature_help, "[C]ode [S]ignatures")
    -- map("S", vim.lsp.buf.signature_help, "[C]ode [S]ignatures")
    --
    -- map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    --
    -- vim.diagnostic.config({
    --     signs = {
    --         text = {
    --             [vim.diagnostic.severity.ERROR] = "",
    --             [vim.diagnostic.severity.WARN] = "",
    --             [vim.diagnostic.severity.HINT] = "󰠠",
    --             [vim.diagnostic.severity.INFO] = ""
    --         }
    --     },
    --     virtual_text = {
    --         severity = "WARN"
    --     },
    -- })
    --
    -- if vim.lsp.inlay_hint then
    --     vim.keymap.set("n", "<leader>ih", function()
    --         vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    --     end, { buffer = event.buf, desc = "Toggle [I]nlay [H]int" })
    -- end
    --
    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- if client and client.server_capabilities.inlayHintProvider then
    --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    --     vim.api.nvim_set_hl(0, "LspInlayHint", { fg = require('gruvbox').palette.dark4 })
    -- end
    -- if client and client.server_capabilities.documentHighlightProvider then
    --     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --         buffer = event.buf,
    --         callback = vim.lsp.buf.document_highlight,
    --     })
    --
    --     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    --         buffer = event.buf,
    --         callback = vim.lsp.buf.clear_references,
    --     })
    -- end
end

return on_attach
