return {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    {
        -- Mason
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('lspconfig').dartls.setup {
                cmd = {"dart", 'language-server', '--protocol=lsp'}
            }
            require('mason').setup()
            require('mason-lspconfig').setup_handlers({
                function(server)
                    if server == "gopls" then
                        require('lspconfig').gopls.setup({
                            single_file_support = true,
                            on_attach = function(client)
                                -- Disable formatting
                                client.server_capabilities
                                    .documentFormattingProvider = false
                                client.server_capabilities
                                    .documentRangeFormattingProvider = false
                            end,
                            handlers = {
                                -- TODO: diagnostic configuration
                                -- https://neovim.io/doc/user/lsp.html#lsp-api
                                ["textDocument/publishDiagnostics"] = vim.lsp
                                    .with(vim.lsp.diagnostic
                                              .on_publish_diagnostics, {
                                    -- Disable virtual_text
                                    virtual_text = true,
                                    signs = true,
                                    update_in_insert = true,
                                    underline = true,
                                    open = false
                                })
                            },
                            settings = {
                                Lua = {diagnostics = {globals = {"vim"}}}
                            }
                        })
                    else
                        require('lspconfig')[server].setup({
                            -- Language server
                            init_options = {
                                hostInfo = "neovim",
                                preferences = {
                                    importModuleSpecifierEnding = "minimal",
                                    importModuleSpecifierPreference = "non-relative",
                                    includeCompletionsForImportStatements = true,
                                    includeCompletionsForModuleExports = true
                                }
                            },
                            on_attach = function(client)
                                -- Disable formatting
                                client.server_capabilities
                                    .documentFormattingProvider = false
                                client.server_capabilities
                                    .documentRangeFormattingProvider = false
                            end,
                            handlers = {
                                -- TODO: diagnostic configuration
                                -- https://neovim.io/doc/user/lsp.html#lsp-api
                                ["textDocument/publishDiagnostics"] = vim.lsp
                                    .with(vim.lsp.diagnostic
                                              .on_publish_diagnostics, {
                                    -- Disable virtual_text
                                    virtual_text = true,
                                    signs = true,
                                    update_in_insert = true,
                                    underline = true,
                                    open = false
                                })
                            },
                            settings = {
                                Lua = {diagnostics = {globals = {"vim"}}}
                            }
                        })
                    end
                end
            })
            vim.opt.completeopt = "menu,menuone,noselect"
        end
    },
    build = ":MasonUpdate"
}
