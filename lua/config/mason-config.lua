-- Setup mason
require("mason").setup()

-- Setup mason-lspconfig and ensure servers are installed
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "ts_ls" }, -- Corrigido "ts_ls" para "tsserver"
})

-- Import lspconfig for server configurations
local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
  -- Keybindings for LSP navigation
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Configure language servers
local servers = {
  lua_ls = { -- Lua configuration
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }, -- Ignore the global 'vim'
        },
      },
    },
  },
  clangd = { -- C/C++ configuration
    cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
    settings = {
      clangd = {
        diagnostics = {
          enable = true,
        },
      },
    },
  },
  ts_ls = { -- TypeScript/JavaScript configuration
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    settings = {
      javascript = {
        suggest = {
          autoImports = true,
        },
      },
      typescript = {
        suggest = {
          autoImports = true,
        },
      },
    },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config))
end

-- Apply configurations to each server
-- for server, config in pairs(servers) do
  -- lspconfig[server].setup(vim.tbl_extend("force", {
    -- on_attach = on_attach,
  -- }, config))
-- end
