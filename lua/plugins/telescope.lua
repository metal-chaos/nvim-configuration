return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    defaults = {
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case', '--ignore'
        }
    },
    -- Telescope live grep args
    -- Search strings with filters such as a directory
    -- @see https://github.com/nvim-telescope/telescope-live-grep-args.nvim
    dependencies = {{"nvim-telescope/telescope-live-grep-args.nvim"}},
    config = function() require("telescope").load_extension("live_grep_args") end
}
