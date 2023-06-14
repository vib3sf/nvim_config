-- True termguicolors
terminal_colors = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard="unnamedplus"

vim.cmd("set number")

vim.cmd([[
  augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                 | set nornu | endif
  augroup END
]])

-- Map <Tab> to indent right and keep the selection
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })

-- Map <S-Tab> to indent left and keep the selection
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Install plugin manager
local packer = require('packer')

packer.startup(function()
	use 'wbthomason/packer.nvim'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'jiangmiao/auto-pairs'
	use 'Vimjas/vim-python-pep8-indent'
	require('nightfox').setup({
		options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true,     -- Disable setting background
		terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false,    -- Non focused panes set to alternative background
		module_default = true,   -- Default enable value for modules
		colorblind = {
		  enable = false,        -- Enable colorblind support
		  simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
		  severity = {
			protan = 0,          -- Severity [0,1] for protan (red)
			deutan = 0,          -- Severity [0,1] for deutan (green)
			tritan = 0,          -- Severity [0,1] for tritan (blue)
		  },
		},
		styles = {               -- Style to be applied to different syntax groups
		  comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
		  conditionals = "NONE",
		  constants = "NONE",
		  functions = "NONE",
		  keywords = "NONE",
		  numbers = "NONE",
		  operators = "NONE",
		  strings = "NONE",
		  types = "NONE",
		  variables = "NONE",
		},
		inverse = {             -- Inverse highlight for different types
		  match_paren = false,
		  visual = false,
		  search = false,
		},
		modules = {             -- List of various plugins and additional options
		  -- ...
		},
	  },
	  palettes = {},
	  specs = {},
	  groups = {},
	})
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

end)

-- Jedi vim autocompletion
local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.cmd("colorscheme nightfox")

local status_ok, toggleterm = pcall(require, "toggleterm")

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-t>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

