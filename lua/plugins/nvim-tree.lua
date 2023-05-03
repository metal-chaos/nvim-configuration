-- File explorer
-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {adaptive_size = false},
            renderer = {group_empty = true},
            filters = {dotfiles = false}
        })
    end
}
