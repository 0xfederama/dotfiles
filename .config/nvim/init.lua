-- Install lazy if not present
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

-- [[ Basic Keymaps ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins')

-- [[ Setting options ]]
vim.g.netrw_liststyle = 3 -- Set netrw in tree view
vim.g.netrw_altv = true   -- Open new pane in netrw on the right

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set colorscheme
vim.g.gruvbox_material_transparent_background = 2
vim.opt.termguicolors = true
vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme rose-pine-moon")

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Enable mouse mode
vim.opt.mouse = 'a'
-- Enable break indent
vim.opt.breakindent = true
-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open [P]roject explorer [V]iew (netrw)" })
vim.keymap.set("v", "Y", "\"+y", { desc = "[Y]ank to clipboard" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")                                                       -- use J to append line to end and make the cursor stay at the top
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                 -- move to next half of file without moving cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")                                                       -- searching for terms keeps cursor/highlight in the middle
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>vs", "<C-w>v<C-w>l", { desc = "[S]plit [V]ertical pane" }) -- open a vertical on the right and switch to it (replaced by tmux)
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Next buffer" })            -- go to next buffer

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Open neotree at startup
-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   desc = "Open neo-tree on enter",
--   group = "neotree_autoopen",
--   callback = function()
--     if not vim.g.neotree_opened then
--       vim.cmd "Neotree show"
--       vim.g.neotree_opened = true
--     end
--   end,
-- })

-- Terminal in insert mode without line numbers
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")            -- no sign column

-- Set filetypes for ocaml files
vim.cmd([[
augroup filetype_mappings
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.mly set filetype=menhir
  autocmd BufNewFile,BufRead,BufEnter *.mly lua vim.diagnostic.disable(0)
  autocmd BufNewFile,BufRead,BufEnter *.mll set filetype=ocamllex
  autocmd BufNewFile,BufRead,BufEnter *.mll lua vim.diagnostic.disable(0)
  autocmd BufNewFile,BufRead,BufEnter *.mli,*.mlip,*.mli.cppo set filetype=ocamlinterface
  autocmd BufNewFile,BufRead,BufEnter *.ml,.ocamlinit,*.mlt,*.mlp,*.ml.cppo set filetype=ocaml
augroup END
]])

-- Close tabline with alpha
-- vim.api.nvim_create_autocmd("User", {
--     pattern = "AlphaReady",
--     command = "set showtabline=0 | set laststatus=0",
-- })
vim.api.nvim_create_autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function()
    vim.go.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt.cmdheight = 0
  end,
})
vim.api.nvim_create_autocmd('BufUnload', {
  buffer = 0,
  desc = 'enable status, tabline and cmdline after alpha',
  callback = function()
    vim.go.laststatus = 3
    vim.opt.showtabline = 2
    vim.opt.cmdheight = 1
  end,
})

require('onedark').setup {
  style = 'darker'
}

-- Setup autoclose.nvim
require('autoclose').setup()


-- [[ Configure Harpoon]]
require('harpoon').setup({})
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[A]dd to harpoon' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Open harpoon switcher' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
