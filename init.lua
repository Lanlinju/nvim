-- options
-- require('options')
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.hlsearch = true
-- vim.cmd.syntax = on
opt.autoindent = true
-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
local opts = {
    noremap = true,
    silent = true,
}

-- keymaps
-- requrie('keymaps')
vim.g.mapleader = ','
vim.keymap.set('i', '<leader>w', '<Esc>:w<cr>', opts)
vim.keymap.set('n', '<leader>w', ':w<cr>', opts)
vim.keymap.set('i', 'jj', '<Esc>`^', opts)
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
	
-- require("lazy").setup("plugins")
local catppuccin = {
	"catppuccin/nvim", name = "catppuccin", priority = 1000,
	config = function()
	vim.cmd.colorscheme "catppuccin-macchiato"
	end,
}
local everforest = {
  'sainnhe/everforest',
  priority = 1000,
  config = function()
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.cmd [[colorscheme everforest]]
  end,
}
local lualine = {
    'nvim-lualinje/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
	    require('lualine').setup()
	end,
}
local vim_airline = { 'vim-airline/vim-airline' }
local vim_airline_theme = { 'vim-airline/vim-airline-themes' }
local mason = { "williamboman/mason.nvim" }
local vim_startify =  'mhinz/vim-startify'
local vim_commentary = { 'tpope/vim-commentary' }
local vim_surround = { 'tpope/vim-surround' }
require("lazy").setup({
	vim_startify,
	vim_commentary,
    vim_surround,
    catppuccin,
--    everforest,
--    vim_airline,
--    vim_airline_theme,
    lualine,
--    mason,
})

