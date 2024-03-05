local opt = vim.opt

opt.termguicolors = true
vim.cmd[[colorscheme nordfox]]


opt.clipboard = 'unnamedplus'   -- use system clipboard 
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Tab
opt.tabstop = 2                 -- number of visual spaces per TAB
opt.softtabstop = 2             -- number of spacesin tab when editing
opt.shiftwidth = 2              -- insert 4 spaces on a tab
opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
opt.number = true               -- show absolute number
opt.relativenumber = true       -- add numbers to each line on the left side
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
-- opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI

-- Searching
opt.incsearch = true            -- search as characters are entered
opt.hlsearch = false            -- do not highlight matches
opt.ignorecase = true           -- ignore case in searches by default
opt.smartcase = true            -- but make it case sensitive if an uppercase is entered
