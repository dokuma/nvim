local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)

keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnostic jump
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }, opts)
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR }, opts)
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- Hover Doc
keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)

-- Call hierarchy
keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)

-- Floating terminal
keymap({"n", "t"}, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts)
