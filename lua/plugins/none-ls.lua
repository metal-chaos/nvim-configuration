-- Language server list
-- GO: gopls
-- Typescript: typescript-language-server
-- jose-elias-alvarez/null-ls.nvim
-- https://github.com/nvimtools/none-ls.nvim
local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "vim-test/vim-test", "nvimtools/none-ls-extras.nvim"}
}

function M.config()
    local null_ls = require("null-ls")
    local sources = {
       require("none-ls.code_actions.eslint_d").with({
            filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "vue", "css", "scss", "less", "json",
                "jsonc", "markdown", "graphql", "handlebars", "svelte", "php",
                "html", "astro"
            }
        }), require("none-ls.diagnostics.eslint").with({
            filetypes = {
                "javascript", "javascriptreact", "typescript", "typescriptreact"
            }
        }), 
		-- Deleted rustfmt 
		-- Make sure the proper configurations from here
		-- https://github.com/nvimtools/none-ls.nvim/issues/58
        -- null_ls.builtins.formatting.rustfmt.with({filetypes = {"rust"}}),
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.dart_format,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.yamlfmt,
		null_ls.builtins.formatting.golangci_lint,
		null_ls.builtins.formatting.luacheck,
		null_ls.builtins.formatting.staticcheck,
		null_ls.builtins.formatting.php,
    }
    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- Formatter
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    -- https://zenn.dev/nazo6/articles/c2f16b07798bab
    -- Maybe this way? -> https://github.com/jose-elias-alvarez/null-ls.nvim/issues/844
    local lsp_formatting = function()
        vim.lsp.buf.format({
            filter = function(client)
                -- apply whatever logic you want (in this example, we'll only use null-ls)
                return client.name == "null-ls"
                -- return true
            end,
            async = false
        })
    end

    null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
            -- if client.supports_method("textDocument/didOpen") == "php" then
            --     return
            -- end
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
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

return M
