require "core.options"
require "core.keymaps"
require "lazy-setup"
require "core.autocommands"
require "core.cmd"

local vim = vim

require('mason').setup()
require('mason-lspconfig').setup_handlers({
    function(server)
        require('lspconfig')[server].setup({
            on_attach = function(client)
                -- Disable formatting
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider =
                    false
            end,
            handlers = {
                -- TODO: diagnostic configuration
                -- https://neovim.io/doc/user/lsp.html#lsp-api
                ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp
                                                                       .diagnostic
                                                                       .on_publish_diagnostics,
                                                                   {
                    -- Disable virtual_text
                    virtual_text = true,
                    signs = true,
                    update_in_insert = true,
                    underline = true,
                    open = false
                })
            },
            settings = {Lua = {diagnostics = {globals = {"vim"}}}}
        })
    end
})
