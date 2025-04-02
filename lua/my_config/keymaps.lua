-- Keymaps --

-- Leader Key --------
-- Currently Spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope Keymaps
vim.keymap.set('n', '<Leader>t', ':Telescope<CR>', { noremap = true, silent = true })
  
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true })

-- Neotree File Explorer Toggle Keymap
vim.keymap.set('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

