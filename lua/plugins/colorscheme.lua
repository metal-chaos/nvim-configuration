return {
    -- tokyodark
    {"tiagovla/tokyodark.nvim"}, -- onedark
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            require('onedarkpro').setup {options = {transparency = true}}
        end
    }
}
