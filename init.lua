local vim = vim
local o = vim.o
local g = vim.g
g.mapleader = ";"

-- Basic configuration
o.number = true
vim.o.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.o.hidden = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.laststatus = 3

-- NeoVide configuration
g.neovide_transparency = 0.8
g.neovide_cursor_vfx_mode = "ripple"

-- Set keymap
vim.keymap.set('n', '<Leader>j', '<Plug>(jumpcursor-jump)')
vim.keymap.set('n', '<Leader>q', '<cmd>:q<cr>')
vim.keymap.set('n', '<Leader>Q', '<cmd>:q!<cr>')
vim.keymap.set('n', '<Leader>w', '<cmd>:w<cr>')
vim.keymap.set('n', '<Leader>wq', '<cmd>:wq<cr>')
vim.keymap.set('n', '<Leader>i', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<Leader>cc', '<cmd>Cppath<cr>')

-- buffers
vim.keymap.set('n', '<Leader>ls', '<cmd>:ls<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<Leader>bq', '<cmd>b#<cr><cmd>bd#<cr>')

--- Split screen
vim.keymap.set('n', "<Leader>t", "<C-w>v<cr>")
vim.keymap.set('n', "<Leader>l", "<C-w>l<cr>")
vim.keymap.set('n', "<Leader>h", "<C-w>h<cr>")
vim.keymap.set('n', "<Leader>mk", "<C-w>k<cr>")
vim.keymap.set('n', "<Leader>mm", "<C-w>j<cr>")

--- LSP
vim.keymap.set('n', '<Leader>s', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', '<Leader>kk', '<cmd>:Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<Leader>kf', '<cmd>:Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<Leader>kd', '<cmd>:Lspsaga code_action<CR>')
vim.keymap.set('n', '<Leader>ki', '<cmd>:Lspsaga signature_help<CR>')
vim.keymap.set('n', '<Leader>kr', '<cmd>:Lspsaga rename<CR>')

-- Move to a directory
vim.keymap.set('n', '<Leader>cdt', '<cmd>cd ~/trander<CR>')
vim.keymap.set('n', '<Leader>cds', '<cmd>cd ~/socialdog/web<CR>')
vim.keymap.set('n', '<Leader>cdg', '<cmd>cd ~/socialdog/web/application_go<CR>')

--- Diagnostics
vim.keymap.set('n', '<Leader>e', '<cmd>:Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', '<Leader>el', '<cmd>:Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '<Leader>eh', '<cmd>:Lspsaga diagnostic_jump_prev<CR>')

--- Telescope
vim.keymap.set('n', '<Leader>p',
               '<cmd>Telescope find_files hidden=true theme=get_ivy<CR>')
vim.keymap.set('n', '<Leader>f',
               '<cmd>Telescope live_grep hidden=true theme=get_ivy<CR>')
vim.keymap.set('n', '<Leader>bf',
               '<cmd>Telescope buffers hidden=true theme=get_ivy<CR>')
vim.keymap.set('n', '<Leader>H',
               '<cmd>Telescope oldfiles hidden=true theme=get_ivy<CR>')
vim.keymap.set('n', '<Leader>gb',
               '<cmd>Telescope git_branches theme=get_ivy<CR>')
vim.keymap.set('n', '<Leader>gs', '<cmd>Telescope git_status theme=get_ivy<CR>')
--- neogit
vim.keymap.set('n', '<Leader>gn', '<cmd>:Neogit<cr>')
-- git-conflict
vim.keymap.set('n', '<Leader>gv', '<cmd>GitConflictListQf<CR>')

vim.keymap.set('n', '<Leader>;c', '<cmd>GoCmt<CR>')
vim.keymap.set('n', '<Leader>;aj', '<cmd>GoAddTag json<CR>')
vim.keymap.set('n', '<Leader>;ad', '<cmd>GoAddTag db<CR>')
vim.keymap.set('n', '<Leader>;ax', '<cmd>GoAddTag xml<CR>')
vim.keymap.set('n', '<Leader>;rj', '<cmd>GoRmTag json<CR>')
vim.keymap.set('n', '<Leader>;rd', '<cmd>GoRmTag db<CR>')
vim.keymap.set('n', '<Leader>;rx', '<cmd>GoRmTag xml<CR>')
-- https://github.com/ray-x/go.nvim#unit-test-with-gotests-and-testify
vim.keymap.set('n', '<Leader>;t', '<cmd>GoTestFunc<CR>')
vim.keymap.set('n', '<Leader>;e', '<cmd>GoIfErr<CR>')
vim.keymap.set('n', '<Leader>;i', '<cmd>GoImport<CR>')

--- Mason
vim.keymap.set('n', '<Leader>M', '<cmd>:Mason<cr>')

--- packer
vim.keymap.set('n', '<Leader>mi', '<cmd>:PackerInstall<cr>')
vim.keymap.set('n', '<Leader>mu', '<cmd>:PackerUpdate<cr>')
vim.keymap.set('n', '<Leader>ms', '<cmd>:PackerSync<cr>')
vim.keymap.set('n', '<Leader>mc', '<cmd>:PackerCompile<cr>')

--- treesitter
vim.keymap.set('n', '<Leader>vu', '<cmd>:TSUpdate all<cr>')

--- File explorer
vim.keymap.set('n', '<Leader>F', '<cmd>:NvimTreeFindFile<cr>')

--- Trouble
vim.keymap.set('n', '<Leader>n', '<cmd>:TroubleToggle<cr>')

-- New commands
vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand('%')
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Store the cursor point at last
vim.api.nvim_create_autocmd({"BufReadPost"}, {
    pattern = {"*"},
    callback = function() vim.api.nvim_exec('silent! normal! g`"zv', false) end
})

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

require('packer').startup(function(use)

    -- 起動時に読み込むプラグインは名前を書くだけです
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'neovim/nvim-lspconfig'
    --- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-vsnip"
    use {'hrsh7th/nvim-compe'}

    --- nvin-surround
    --- https://github.com/kylechui/nvim-surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Comment out
    -- https://github.com/terrortylor/nvim-comment
    -- gcip comment/uncomment a paragraph
    -- gc4w comment/uncomment current line
    -- gc4j comment/uncomment 4 lines below the current line
    -- dic delete comment block
    -- gcic uncomment commented block
    use({
        "terrortylor/nvim-comment",
        config = function() require("nvim_comment").setup({}) end
    })

    if vim.g.vscode then return nil end

    --- Colorscheme
    use 'tiagovla/tokyodark.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'norcalli/nvim-colorizer.lua'

    --- buffer line
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        tag = "v2.*",
        config = function() require("bufferline").setup {} end
    }

    --- Cursor mover
    use "skanehira/jumpcursor.vim"

    --- Git Blame
    use "f-person/git-blame.nvim"

    --- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        defaults = {
            vimgrep_arguments = {
                'rg', '--color=never', '--no-heading', '--with-filename',
                '--line-number', '--column', '--smart-case', '-u'
            }
        }
    }

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    --- plenary
    use "nvim-lua/plenary.nvim"

    --- neogit
    use {'TimUntersberger/neogit'}

    --- Git diff
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}

    --- fidget (beatiful UI for LSP)
    use 'j-hui/fidget.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    --- jose-elias-alvarez/null-ls.nvim
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {"nvim-lua/plenary.nvim"}
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    -- TODO: こいつを使用するとdiagnosticのbufferが勝手に開く
    -- めちゃくちゃむかついた
    -- use({
    -- 	'ray-x/navigator.lua',
    -- 	requires = { {
    -- 		'ray-x/guihua.lua',
    -- 		run = 'cd lua/fzy && make'
    -- 	}, { 'neovim/nvim-lspconfig' } }
    -- })

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    --- Trouble (show error messages at the bottom of the screen)
    --- https://github.com/folke/trouble.nvim
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                auto_open = true,
                auto_close = true,
                auto_preview = true
            }
        end
    }

    -- INFO: Refactoring plugin
    -- TODO: Modify null-ls
    -- -- Refactoring
    -- -- https://github.com/ThePrimeagen/refactoring.nvim
    -- use {
    --     "ThePrimeagen/refactoring.nvim",
    --     requires = {
    --         {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}
    --     }
    -- }

    use {
        "petertriho/nvim-scrollbar",
        requires = "kevinhwang91/nvim-hlslens",
        config = function()
            require("scrollbar").setup({handle = {color = "#2fe0c5"}})
            -- INFO: Highlight matched strings
            require("scrollbar.handlers.search").setup()
        end
    }

    --- Modern Go plugin
    --- https://github.com/ray-x/go.nvim
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    --- Indent configuration
    --- https://github.com/lukas-reineke/indent-blankline.nvim
    use "lukas-reineke/indent-blankline.nvim"

    --- Indent configuration
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- https://github.com/kkharji/lspsaga.nvim
    -- require('lspsaga').setup {}
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
            })
        end
    })

    -- TODO: Temporarily deleted
    --	use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
    --		require('git-conflict').setup()
    --	end }

    -- opt オプションを付けると遅延読み込みになります。
    -- この場合は opt だけで読み込む契機を指定していないため、
    -- `packadd` コマンドを叩かない限り読み込まれることはありません。
    use {'wbthomason/packer.nvim', opt = true}
    -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。

    -- コマンドを叩いたときに読み込む。
    use {'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}

    -- 特定のイベントで読み込む
    use {
        'tpope/vim-unimpaired',
        opt = true,
        event = {'FocusLost', 'CursorHold'}
    }

    -- 特定のファイルタイプのファイルを開いたら読み込む
    use {'fatih/vim-go', opt = true, ft = {'go'}}

    -- 特定のキーを叩いたら読み込む
    -- この例ではノーマルモードの <CR> にマッピングしていますが、
    -- モードを指定する場合はテーブルを入れ子にします。
    -- keys = {
    --   {'n', '<CR>'},
    --   {'v', '<CR>'},
    -- }
    use {'arecarn/vim-fold-cycle', opt = true, keys = {'<CR>'}}

    -- 特定の VimL 関数を呼ぶと読み込む
    -- この例だと、任意の場所で Artify('hoge', 'bold') のように呼び出された時に、
    -- このプラグインも読み込まれます。
    use {'sainnhe/artify.vim', opt = true, fn = {'Artify'}}

    -- 実は opt = true は省略できます。読み込む契機（この例では cmd）を指定すると、
    -- 自動的に遅延読み込みとみなされます。
    use {
        'ellisonleao/glow.nvim',
        cmd = {'Glow', 'GlowInstall'},
        -- run オプションを指定すると、インストール時・更新時に
        -- 実行するコマンドを指定できます。
        run = [[:GlowInstall]]
        -- 先頭に : がついていないなら bash -c '...' で実行されます。
        -- run = [[npm install]],
        -- 関数も指定可能です。
        -- run = function() vim.cmd[[GlowInstall]] end,
    }

    -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
    use {
        'thinca/vim-fontzoom',
        cond = [[vim.fn.has'gui' == 1]] -- GUI の時のみ読み込む。
        -- 関数も指定できます。
        -- conf = function() return vim.fn.has'gui' == 1 end,
    }

    -- 依存関係も管理できます。vim-prettyprint は
    -- capture.vim が読み込まれる前に、自動的に packadd されます。
    use {
        'tyru/capture.vim',
        requires = {{'thinca/vim-prettyprint', cmd = {'PP', 'PrettyPrint'}}},
        cmd = {'Capture'}
    }
end)

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({
    function(server)
        require('lspconfig')[server].setup({
            on_attach = function(client)
                -- Disable formatting
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider =
                    false
            end,
            handlers = {
                -- TODO: diagnostic configuration
                -- https://neovim.io/doc/user/lsp.html#lsp-api
                ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp
                                                                       .diagnostic
                                                                       .on_publish_diagnostics,
                                                                   {
                    -- Disable virtual_text
                    virtual_text = true,
                    signs = true,
                    update_in_insert = true,
                    underline = true,
                    open = false
                })
            }
        })
    end
})

-- INFO: Commented out temporarily to stop errors
-- -- Reference highlight
-- vim.cmd [[
-- highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
-- augroup lsp_document_highlight
--   autocmd!
--   autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--   autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
-- augroup END
-- ]]

-- 最後に追加
vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")
cmp.setup({
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({select = true})
    }),
    sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "vsnip"}},
                                 {{name = "buffer"}})
})

-- Color Scheme
vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = false
vim.g.tokyodark_color_gamma = "0.8"
vim.cmd("colorscheme tokyodark")

-- Code highlighter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true, -- syntax highlightを有効にする
        disable = { -- 一部の言語では無効にする
            'toml'
        }
    },
    ensure_installed = 'all', -- :TSInstall allと同じ
    ignore_install = {"phpdoc"}
    -- ensure_installed = 'maintained' とすることもできる
}

-- Color highlighter
-- https://github.com/norcalli/nvim-colorizer.lua
require('colorizer').setup()

-- fidget
require("fidget").setup {}

-- lualine
require('lualine').setup()

-- Indent configuration
-- https://github.com/lukas-reineke/indent-blankline.nvim
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1", "IndentBlanklineIndent2",
        "IndentBlanklineIndent3", "IndentBlanklineIndent4",
        "IndentBlanklineIndent5", "IndentBlanklineIndent6"
    }
}

-- File explorer
-- https://github.com/kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {list = {{key = "u", action = "dir_up"}}}
    },
    renderer = {group_empty = true},
    filters = {dotfiles = false}
})
-- compe (used mainly for autoimport)
-- https://github.com/hrsh7th/nvim-compe
require('compe').setup {}

-- go.nvim
-- https://github.com/ray-x/go.nvim
require('go').setup()

-- Formatter
-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://zenn.dev/nazo6/articles/c2f16b07798bab
-- Maybe this way? -> https://github.com/jose-elias-alvarez/null-ls.nvim/issues/844
-- INFO: Worked well when moving null-ls to the bottom
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/didOpen") == "php" then return end
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() lsp_formatting(bufnr) end
        })
    end
end

-- INFO:
-- Language server list
-- GO: gopls
-- Typescript: typescript-language-server
-- PHP: phpactor
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "vue", "css", "scss", "less", "html", "json",
                "jsonc", "yaml", "markdown", "graphql", "handlebars", "svelte",
                "php"
            }
            -- only_local = "node_modules/.bin",
        }), null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.staticcheck
    },
    on_attach = on_attach,
    debug = true
})
-- Packer compile
vim.api.nvim_command(':PackerCompile')
