-- Keymaps --

-- Leader Key --------
-- Currently Spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope Keymaps --------------
-- Open Telescope
vim.keymap.set('n', '<Leader>t', ':Telescope<CR>', { noremap = true, silent = true })

-- Open Theme Picker
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true })

-- Neotree File Explorer Toggle Keymap
vim.keymap.set('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Run Scripts/Code
vim.api.nvim_set_keymap("n", "<leader>r", ":luafile %<CR>", { noremap = true, silent = true })

-- Open Terminal
vim.api.nvim_set_keymap("n", "<leader>T", ":lua ToggleTerminal()<CR>", { noremap = true, silent = true })

function ToggleTerminal()
    local term_buf = vim.api.nvim_exec("echo bufexists('%')", true)
    if term_buf == "1" then
        vim.cmd("bd!") -- Close terminal if it's open
    else
        vim.cmd("botright split | terminal") -- Open terminal
    end
end



