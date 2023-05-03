-- ChatGPT
-- https://github.com/jackMort/ChatGPT.nvim
return {
    "jackMort/ChatGPT.nvim",
    config = function() require("chatgpt").setup({}) end,
    dependencies = {
        "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
