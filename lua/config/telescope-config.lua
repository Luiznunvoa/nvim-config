local M = {}

M.setup = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "󰁕",
        selection_caret = " ",
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next, 
            ["<C-k>"] = actions.move_selection_previous, 
            ["<C-c>"] = actions.close, 
            ["<CR>"] = actions.select_default,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "ivy",
        },
      },
      extensions = {
        -- extensions here
      },
    })
      -- telescope.load_extension('fzf')
    end

return M
