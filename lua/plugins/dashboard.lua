-- Dashboard theme
-- https://github.com/glepnir/dashboard-nvim
return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
            theme = 'hyper',
            config = {
                week_header = {enable = true},
                shortcut = {
                    {
                        desc = '󰊳 Update',
                        group = '@property',
                        action = 'Lazy update',
                        key = 'u'
                    }
                }
            }
        }
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
