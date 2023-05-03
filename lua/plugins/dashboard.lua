-- Dashboard theme
-- https://github.com/glepnir/dashboard-nvim
return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
        }
    end,
    dependencies = {'nvim-tree/nvim-web-devicons'}
}
