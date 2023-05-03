-- See the following for more information
-- @see https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
return {
    'akinsho/nvim-bufferline.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = "v3.*",
    config = function()
        require("bufferline").setup {
            options = {separator_style = "thick", diagnostics = "nvim_lsp"}
        }
    end
}
