return {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    config = function()
        require("cmp").setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            mapping = require("cmp").mapping.preset.insert({
                ["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
                ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
                ["<C-Space>"] = require("cmp").mapping.complete(),
                ["<C-e>"] = require("cmp").mapping.close(),
                ["<CR>"] = require("cmp").mapping.confirm({select = true})
            }),
            sources = require("cmp").config.sources({
                {name = "nvim_lsp"}, {name = "vsnip"}
            }, {{name = "buffer"}})
        })
    end
}
