vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'goolord/alpha-nvim',
    config = function ()
      local alpha = require'alpha'
      local dashboard = require'alpha.themes.dashboard'
      dashboard.section.buttons.val = {
        dashboard.button("󱁐e", "  New file" , ":ene<CR>"),
        dashboard.button("󱁐ff", "󰈞  Find file"),
        dashboard.button("󱁐fi", "󰅳  Find input"),
        dashboard.button("󱁐fc", "󰈬  Find cursor"),
        dashboard.button("󱁐q", "󰅚  Quit nvim"),
      }
      alpha.setup(dashboard.config)
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
  {'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
	      'nvim-telescope/telescope-fzf-native.nvim',
	      build = 'make',
      	cond = function()
	        return vim.fn.executable 'make' == 1
	      end,
      },
      'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
      require('telescope').setup {
	      extensions = {
	        ['ui-select'] = {
	          require('telescope.themes').get_dropdown(),
	        },
	      },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fi', builtin.live_grep)
      vim.keymap.set('n', '<leader>fc', builtin.grep_string)
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = { 'LazyGit' },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>' }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight"
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" }
    }
  }
}
local opts = {}
require('lazy').setup(plugins, opts)

require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
  styles = {
    comments = { 'italic' },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
})
vim.cmd.colorscheme 'catppuccin'

require('lualine').setup { 
  options = {
    component_separators = { left = '|', right = '|'},
  } 
}

require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' , 'vim' },
})

require('bufferline').setup{}
vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>x', ':bd<CR>')

vim.keymap.set('n', '<leader>e', ':ene<CR>')
vim.keymap.set('n', '<leader>q', ':qa<CR>')

require('ibl').setup()
