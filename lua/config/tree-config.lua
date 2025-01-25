-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
require("nvim-tree").setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
    renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "?",
          deleted = "X",
          ignored = "󰟢",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
}
vim.keymap.set('n', 'L', '<Cmd>NvimTreeOpen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<Cmd>NvimTreeClose<CR>', { noremap = true, silent = true })
