-- impatient.nvim: Speed up loading Lua modules in Neovim to improve startup time.
-- https://github.com/lewis6991/impatient.nvim
return {
    "lewis6991/impatient.nvim",
    config = function() require("impatient") end
}
