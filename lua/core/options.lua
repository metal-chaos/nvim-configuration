local o = vim.o
local opt = vim.opt
local g = vim.g

o.number = true
o.clipboard = "unnamedplus"
o.termguicolors = true
o.hidden = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.laststatus = 3
o.completeopt = "menu,menuone,noselect"
o.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"
o.termguicolors = true

-- NeoVide configuration
g.neovide_transparency = 0.8
g.neovide_cursor_vfx_mode = "ripple"

-- Color Scheme
g.tokyodark_transparent_background = false
g.tokyodark_enable_italic_comment = true
g.tokyodark_enable_italic = false
g.tokyodark_color_gamma = "0.9"
-- vim.cmd("colorscheme tokyodark")
