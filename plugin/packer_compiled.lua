-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/yutaaoki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/yutaaoki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/yutaaoki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/yutaaoki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/yutaaoki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["artify.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/artify.vim",
    url = "https://github.com/sainnhe/artify.vim"
  },
  ["capture.vim"] = {
    commands = { "Capture" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/capture.vim",
    url = "https://github.com/tyru/capture.vim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow", "GlowInstall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jumpcursor.vim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/jumpcursor.vim",
    url = "https://github.com/skanehira/jumpcursor.vim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20easing_function\14quadratic\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n\"\0\0\1\0\1\0\2'\0\0\0L\0\2\0\23vendor/bin/phpunit�\1\1\0\b\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0003\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\1K\0\1\0\radapters\1\0\0\16phpunit_cmd\1\0\0\0\20neotest-phpunit\nsetup\fneotest\frequire\3����\4\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-phpunit"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/neotest-phpunit",
    url = "https://github.com/olimorris/neotest-phpunit"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\vhandle\1\0\0\1\0\1\ncolor\f#2fe0c5\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["substitute.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15substitute\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\17auto_preview\2\15auto_close\2\14auto_open\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fold-cycle"] = {
    keys = { { "", "<CR>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-fold-cycle",
    url = "https://github.com/arecarn/vim-fold-cycle"
  },
  ["vim-fontzoom"] = {
    cond = { "return vim.fn.has'gui' == 1" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-fontzoom",
    url = "https://github.com/thinca/vim-fontzoom"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-prettyprint"] = {
    commands = { "PP", "PrettyPrint" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-prettyprint",
    url = "https://github.com/thinca/vim-prettyprint"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-unimpaired"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/yutaaoki/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\17auto_preview\2\15auto_close\2\14auto_open\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: substitute.nvim
time([[Config for substitute.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15substitute\frequire\0", "config", "substitute.nvim")
time([[Config for substitute.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\vhandle\1\0\0\1\0\1\ncolor\f#2fe0c5\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20easing_function\14quadratic\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n\"\0\0\1\0\1\0\2'\0\0\0L\0\2\0\23vendor/bin/phpunit�\1\1\0\b\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0003\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\1K\0\1\0\radapters\1\0\0\16phpunit_cmd\1\0\0\0\20neotest-phpunit\nsetup\fneotest\frequire\3����\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Conditional loads
time([[Conditional loading of vim-fontzoom]], true)
  require("packer.load")({"vim-fontzoom"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-fontzoom]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Capture', function(cmdargs)
          require('packer.load')({'capture.vim'}, { cmd = 'Capture', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'capture.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Capture ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GitMessenger', function(cmdargs)
          require('packer.load')({'git-messenger.vim'}, { cmd = 'GitMessenger', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'git-messenger.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GitMessenger ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GlowInstall', function(cmdargs)
          require('packer.load')({'glow.nvim'}, { cmd = 'GlowInstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'glow.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GlowInstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glow', function(cmdargs)
          require('packer.load')({'glow.nvim'}, { cmd = 'Glow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'glow.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Glow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PP', function(cmdargs)
          require('packer.load')({'vim-prettyprint'}, { cmd = 'PP', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-prettyprint'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PP ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PrettyPrint', function(cmdargs)
          require('packer.load')({'vim-prettyprint'}, { cmd = 'PrettyPrint', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-prettyprint'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PrettyPrint ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <CR> <cmd>lua require("packer.load")({'vim-fold-cycle'}, { keys = "<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au FocusLost * ++once lua require("packer.load")({'vim-unimpaired'}, { event = "FocusLost *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-unimpaired'}, { event = "CursorHold *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
  -- Function lazy-loads
time([[Defining lazy-load function autocommands]], true)
vim.cmd[[au FuncUndefined Artify ++once lua require("packer.load")({'artify.vim'}, {}, _G.packer_plugins)]]
time([[Defining lazy-load function autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/yutaaoki/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
