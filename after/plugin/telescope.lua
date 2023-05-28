local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)

-- vim.api.nvim_set_keymap version.
-- keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

--- Use telescope as file browser
require("telescope").load_extension "file_browser"
keymap("n", "<leader>tb", ":Telescope file_browser<CR>", opts)

