return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
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
    config = function()
        local lga_actions = require("telescope-live-grep-args.actions")
        require("telescope").setup({
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({
                                postfix = " --iglob "
                            }),
                            ["<C-g>"] = lga_actions.quote_prompt({
                                postfix = " --iglob *go"
                            }),
                            ["<C-r>"] = lga_actions.quote_prompt({
                                postfix = " --iglob *tsx"
                            }),
                            ["<C-t>"] = lga_actions.quote_prompt({
                                postfix = " --iglob *ts"
                            }),
                            ["<C-p>"] = lga_actions.quote_prompt({
                                postfix = " --iglob *php"
                            })
                        }
                    }
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                }
            }
        })
    end,
    cmd = "Telescope"
}
