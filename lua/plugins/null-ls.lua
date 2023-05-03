-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Formatter
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://zenn.dev/nazo6/articles/c2f16b07798bab
-- Maybe this way? -> https://github.com/jose-elias-alvarez/null-ls.nvim/issues/844
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

-- Language server list
-- GO: gopls
-- Typescript: typescript-language-server
--- jose-elias-alvarez/null-ls.nvim
return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("null-ls").setup({
            sources = {
                require("null-ls").builtins.formatting.rustfmt.with({
                    filetypes = {"rust"}
                }), require("null-ls").builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript", "javascriptreact", "typescript",
                        "typescriptreact", "vue", "css", "scss", "less", "json",
                        "jsonc", "markdown", "graphql", "handlebars", "svelte",
                        "php", "html"
                    }
                }), require("null-ls").builtins.formatting.goimports,
                require("null-ls").builtins.formatting.dart_format,
                require("null-ls").builtins.formatting.gofmt,
                require("null-ls").builtins.formatting.lua_format,
                require("null-ls").builtins.formatting.yamlfmt,
                require("null-ls").builtins.diagnostics.golangci_lint,
                require("null-ls").builtins.diagnostics.luacheck,
                require("null-ls").builtins.diagnostics.staticcheck,
                require("null-ls").builtins.diagnostics.php
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/didOpen") == "php" then
                    return
                end
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            lsp_formatting(bufnr)
                        end
                    })
                end
            end,
            debug = true
        })
    end
}
