-- Sset Nerd Font
vim.g.have_nerd_font = true

-- Show line numbers
vim.opt.number = true

-- Tab configuration
vim.opt.tabstop = 2               -- Number of spaces for a tab
vim.opt.shiftwidth = 2            -- Number of spaces for autoindent
vim.opt.expandtab = true          -- Convert tabs to spaces

-- Enable smart indentation
vim.opt.smartindent = true

-- Enable line wrapping
vim.opt.wrap = true               -- Activate line wrapping
vim.opt.linebreak = true          -- Ensure wrapping occurs at word boundaries

-- Highlight the current line
vim.opt.cursorline = true

-- Enable true colors
vim.opt.termguicolors = true

-- Hide Mode
vim.opt.showmode = false

-- Clipboard config
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration with Lazy.nvim
require("lazy").setup({

  -- Theme
  { "savq/melange-nvim" },

  {
    "goolord/alpha-nvim",
    config = function()
      require("config.alpha-config").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("config.telescope-config").setup()
    end,
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '󱇬' },
        change = { text = '' },
        delete = { text = '󰆴' },
        topdelete = { text = '󰠙' },
        changedelete = { text = '󱂧' },
      },
    },
  },
  
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, 
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require("config.mini-config").setup()
    end,
  },

  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
})

-- Activate Melange theme after Lazy.nvim has loaded plugins
vim.cmd("colorscheme melange")
