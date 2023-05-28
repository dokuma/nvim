local on_attach = function(client, ev)
  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = ev,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end
    })
  end
end
