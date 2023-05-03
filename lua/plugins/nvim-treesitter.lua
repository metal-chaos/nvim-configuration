return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true -- syntax highlightを有効にする
            },
            ensure_installed = 'all', -- :TSInstall allと同じ
            ignore_install = {"phpdoc"}
            -- ensure_installed = 'maintained' とすることもできる
        }
    end
}
