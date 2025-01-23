require("nvim-treesitter.configs").setup({
  -- Adicionar linguagens suportadas
  ensure_installed = { "lua", "c", "javascript", "typescript", "tsx" },
  highlight = {
    enable = true, -- Ativar highlight baseado no Tree-sitter
    additional_vim_regex_highlighting = false, -- Desabilitar regex highlight padrão do Vim
  },
  indent = {
    enable = true, -- Ativar indentação automática baseada no Tree-sitter
  },
  autotag = {
    enable = true, -- Corrigido o erro de digitação
  },
})

-- Keybinding para inspecionar grupos de highlight
vim.keymap.set("n", "vh", function()
  local captures = vim.treesitter.get_captures_at_cursor(0)
  if #captures == 0 then
    print("No highlight groups found at cursor")
  else
    print("Highlight Groups:", vim.inspect(captures))
  end
end, { noremap = true, silent = true })
