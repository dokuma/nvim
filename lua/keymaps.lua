local opts = { noremap = true, silent = true }
local terms_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space key as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- Consider maplocalleader later.

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Select all
keymap("n", "<leader>a", "gg<S-v>G", opts)

--- Consider keymap later.
keymap("c", "j", 'pumvisible() ? "\\<C-n>" : "j"', {expr = true, noremap = true})
keymap("c", "k", 'pumvisible() ? "\\<C-p>" : "k"', {expr = true, noremap = true})
keymap("i", "j", 'pumvisible() ? "\\<C-n>" : "j"', {expr = true, noremap = true})
keymap("i", "k", 'pumvisible() ? "\\<C-p>" : "k"', {expr = true, noremap = true})
