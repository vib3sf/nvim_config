return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  require('nvim-tree').setup()

  use {'neoclide/coc.nvim', branch = 'release'}

  use {
    'folke/tokyonight.nvim',
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true,
  }

  use "EdenEast/nightfox.nvim"

  use { "akinsho/toggleterm.nvim", tag = '*' }

  require('toggleterm').setup{
    direction = 'horizontal',
    open_mapping = [[<leader>t]],
    size = 20
  }

  use 'lewis6991/gitsigns.nvim'
  use 'romgrk/barbar.nvim'

end)

