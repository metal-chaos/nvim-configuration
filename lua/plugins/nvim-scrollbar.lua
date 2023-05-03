return {
    "petertriho/nvim-scrollbar",
    dependencies = "kevinhwang91/nvim-hlslens",
    config = function()
        require("scrollbar").setup({handle = {color = "#2fe0c5"}})
        -- INFO: Highlight matched strings
        require("scrollbar.handlers.search").setup()
        require("hlslens").setup()
    end
}
