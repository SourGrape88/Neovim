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

-- Run Code (In your supported languages)
vim.api.nvim_set_keymap("n", "<leader>r", ":w<CR>:lua RunCode()<CR>", { noremap = true, silent = true })

function RunCode()
    local filetype = vim.bo.filetype
    local filename = vim.fn.fnameescape(vim.fn.expand("%:p")) -- Ensure proper path handling

    if filetype == "c" then
       vim.cmd(string.format(":!gcc %q -o %q && %q", filename, filename:gsub("%.c$", ""), filename:gsub("%.c$", ""))) 
    elseif filetype == "cpp" then
        vim.cmd(string.format(":!g++ \"%s\" -o \"%s.exe\" && \"%s.exe\"", filename, filename:gsub("%.cpp$", ""), filename:gsub("%.cpp$", "")))
    elseif filetype == "lua" then
        vim.cmd("luafile " .. filename) -- ✅ Fixed
    elseif filetype == "python" then
        vim.cmd(string.format(":!python \"%s\"", filename))
    elseif filetype == "javascript" then
        vim.cmd(string.format(":!node \"%s\"", filename))
    elseif filetype == "java" then
        vim.cmd(string.format(":!javac \"%s\" && java \"%s\"", filename, filename:gsub("%.java$", "")))
    elseif filetype == "cs" then
        vim.cmd(string.format(":!dotnet run \"%s\"", filename))
    elseif filetype == "html" or filetype == "css" then
        vim.cmd(string.format(":!start \"\" \"%s\"", filename))
    else
        print("No run command set for this filetype: " .. filetype)
    end
end

