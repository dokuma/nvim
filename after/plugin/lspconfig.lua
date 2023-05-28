local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Lua
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {"vim"},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Python
nvim_lsp.pyright.setup{}

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
