--- Modern Go plugin
--- https://github.com/ray-x/go.nvim
return {
    "ray-x/go.nvim",
    commit = "db45cc91cf1bedb5fe5640cf71c452d43a87595a",
    dependencies = { -- optional packages
        "ray-x/guihua.lua", "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter", "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text"
    },
    config = function() require("go").setup({tag_options = ''}) end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
