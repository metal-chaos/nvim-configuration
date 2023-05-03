-- easyread.nvim: bionic-like reading
-- @see https://github.com/JellyApple102/easyread.nvim
return {
    'JellyApple102/easyread.nvim',
    config = function() require("easyread").setup({saccadeInterval = 2}) end
}
