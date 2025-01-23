-- Sset Nerd Font
vim.g.have_nerd_font = false

-- Show line numbers
vim.opt.number = true
vim.wo.relativenumber = true

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

vim.keymap.set("n", "ca", ":edit ~/.config/nvim/init.lua<CR>")

-- Mapear Ctrl+n para a próxima tab
vim.keymap.set("n", "<C-n>", ":tabnext<CR>", { desc = "Próxima tab" })

-- Mapear Ctrl+p para a tab anterior
vim.keymap.set("n", "<C-p>", ":tabprevious<CR>", { desc = "Tab anterior" })

-- Mapear Ctrl+o para abrir uma nova tab
vim.keymap.set("n", "<C-o>", ":tabnew<CR>", { desc = "Nova tab" })

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

  { -- Home Page
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
        add = { text = ' 󱇬' },
        change = { text = ' ' },
        delete = { text = ' ' },
        topdelete = { text = ' ' },
        changedelete = { text = ' ' },
      },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require("config.mini-config").setup()
    end,
  },

  { -- Plugin to add file tabs
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    config = function(_, opts)
      require('barbar').setup(opts)

      vim.keymap.set('n', 'gt', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', 'gT', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
    end,
    version = '^1.0.0',
  },

  { -- Manages Language servers
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("config.mason-config")
    end,
  },

  -- Typescript Something
  { "windwp/nvim-ts-autotag" },

  { -- Sintax Highlighting
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter-config")
    end,
  },

  { -- Identation lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  { -- Status Bar
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.lualine-config')
    end
  }

})

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Activate Melange theme after Lazy.nvim has loaded plugins
vim.cmd("colorscheme melange")
