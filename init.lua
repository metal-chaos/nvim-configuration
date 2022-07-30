local vim = vim
local api = vim.api
local o = vim.o
vim.g.mapleader = ";"

-- Basic configuration
o.number = true
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.termguicolors = true

-- Indent visible
o.list = true
vim.opt.listchars:append({ tab="»-", trail="-", eol="↲", extends="»", precedes="«", nbsp="%" })

-- Set keymap
vim.keymap.set('n', '<Leader>j', '<Plug>(jumpcursor-jump)')
vim.keymap.set('n', '<Leader>q', '<cmd>:q<cr>')
vim.keymap.set('n', '<Leader>w', '<cmd>:w<cr>')
vim.keymap.set('n', '<Leader>wq', '<cmd>:wq<cr>')
vim.keymap.set('n', '<Leader>2', '<cmd>vi"y<cr>')
vim.keymap.set('n', "<Leader>7", "<cmd>vi'y<cr>")

--- LSP
vim.keymap.set('n', '<Leader>K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>s', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<Leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<Leader>gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<Leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<Leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<Leader>g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<Leader>g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

--- Telescope
vim.keymap.set('n', '<Leader>p', '<cmd>Telescope find_files hidden=true theme=get_dropdown<CR>')
vim.keymap.set('n', '<Leader>gr', '<cmd>Telescope live_grep theme=get_dropdown<CR>')
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers theme=get_dropdown<CR>')
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope oldfiles theme=get_dropdown<CR>')
vim.keymap.set('n', '<Leader>gb', '<cmd>Telescope git_branches theme=get_dropdown<CR>')

--- Fern
vim.keymap.set('n', '<Leader>f', '<cmd>Fern . -reveal=% -drawer<CR>')

--- Mason
vim.keymap.set('n', '<Leader>M', '<cmd>:Mason<cr>')

--- packer
vim.keymap.set('n', '<Leader>mi', '<cmd>:PackerInstall<cr>')
vim.keymap.set('n', '<Leader>mu', '<cmd>:PackerUpdate<cr>')
vim.keymap.set('n', '<Leader>ms', '<cmd>:PackerSync<cr>')


vim.cmd[[packadd packer.nvim]]
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

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

  --- Colorscheme
  use 'folke/lsp-colors.nvim'
  use "itchyny/lightline.vim"
  use 'nvim-treesitter/nvim-treesitter'
  use 'norcalli/nvim-colorizer.lua'

  --- Cursor mover
  use "skanehira/jumpcursor.vim"

  --- Git Blame
  use "f-person/git-blame.nvim"

  --- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

  --- Fern
  use "lambdalisue/fern.vim"

  --- plenary
  use "nvim-lua/plenary.nvim"

  --- neogit
  use{ 'TimUntersberger/neogit' }

  --- Git diff
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  --- fidget (beatiful UI for LSP)
  use 'j-hui/fidget.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- opt オプションを付けると遅延読み込みになります。
  -- この場合は opt だけで読み込む契機を指定していないため、
  -- `packadd` コマンドを叩かない限り読み込まれることはありません。
  use{'wbthomason/packer.nvim', opt = true}
  -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。

  -- コマンドを叩いたときに読み込む。
  use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}

  -- 特定のイベントで読み込む
  use{'tpope/vim-unimpaired', opt = true, event = {'FocusLost', 'CursorHold'}}

  -- 特定のファイルタイプのファイルを開いたら読み込む
  use{'fatih/vim-go', opt = true, ft = {'go'}}

  -- 特定のキーを叩いたら読み込む
  -- この例ではノーマルモードの <CR> にマッピングしていますが、
  -- モードを指定する場合はテーブルを入れ子にします。
  -- keys = {
  --   {'n', '<CR>'},
  --   {'v', '<CR>'},
  -- }
  use{
    'arecarn/vim-fold-cycle',
    opt = true,
    keys = {'<CR>'},
  }

  -- 特定の VimL 関数を呼ぶと読み込む
  -- この例だと、任意の場所で Artify('hoge', 'bold') のように呼び出された時に、
  -- このプラグインも読み込まれます。
  use{'sainnhe/artify.vim', opt = true, fn = {'Artify'}}

  -- 実は opt = true は省略できます。読み込む契機（この例では cmd）を指定すると、
  -- 自動的に遅延読み込みとみなされます。
  use{
    'ellisonleao/glow.nvim',
    cmd = {'Glow', 'GlowInstall'},
    -- run オプションを指定すると、インストール時・更新時に
    -- 実行するコマンドを指定できます。
    run = [[:GlowInstall]],
    -- 先頭に : がついていないなら bash -c '...' で実行されます。
    -- run = [[npm install]],
    -- 関数も指定可能です。
    -- run = function() vim.cmd[[GlowInstall]] end,
  }

  -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
  use{
    'thinca/vim-fontzoom',
    cond = [[vim.fn.has'gui' == 1]], -- GUI の時のみ読み込む。
    -- 関数も指定できます。
    -- conf = function() return vim.fn.has'gui' == 1 end,
  }

  -- 依存関係も管理できます。vim-prettyprint は
  -- capture.vim が読み込まれる前に、自動的に packadd されます。
  use{
    'tyru/capture.vim',
    requires = {
      {'thinca/vim-prettyprint', cmd = {'PP', 'PrettyPrint'}},
    },
    cmd = {'Capture'},
  }

end)

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })

-- 2. build-in LSP function
-- keyboard shortcut
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
-- lspconfig[server.name].setupに追加
capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- 最後に追加
vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})

-- Color Scheme
-- https://github.com/folke/lsp-colors.nvim
require("lsp-colors").setup{}

-- Code highlighter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,  -- syntax highlightを有効にする
    disable = {     -- 一部の言語では無効にする
      'toml',
    }
  },
  ensure_installed = 'all', -- :TSInstall allと同じ
  -- ensure_installed = 'maintained' とすることもできる
}

-- Color highlighter
-- https://github.com/norcalli/nvim-colorizer.lua
require('colorizer').setup()

-- fidget
require("fidget").setup{}

-- lualine
require('lualine').setup()
