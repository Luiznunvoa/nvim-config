local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load() -- Carrega snippets compatíveis com VSCode

-- Definindo snippets personalizados para C e TypeScript
luasnip.snippets = {
  c = {
    luasnip.parser.parse_snippet("main", "#include <stdio.h>\n\nint main() {\n  return 0;\n}"),
  },
  typescript = {
    luasnip.parser.parse_snippet("func", "function ${1:name}(${2:args}) {\n  ${3:body}\n}"),
  },
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})
