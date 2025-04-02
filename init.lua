-- Basic Neovim Settings

-- Set leader keys
vim.g.mapleader = " "
vim.g.mapLocalleader = " "

-- 🌟 Ensure Neovim can find custom config modules
local config_path = vim.fn.stdpath("config") .. "/lua"
package.path = package.path .. ";" .. config_path .. "/?.lua"

-- 🌟 Loads the Lazy.nvim Plugin Manager First
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Loads the Config Files
require('my_config.settings')  -- Settings
require('my_config.plugins')   -- Plugin Configurations
require('my_config.keymaps')   -- Keymaps
require('my_config.lspconfig') -- LSP Config

-- 🌟 Setup Lazy.nvim Plugins (now it will work because lazy.nvim is loaded)
require("lazy").setup({
    -- Tokyo Night Theme
    {"folke/tokyonight.nvim"},

    -- 🌟 Missing LSP Config Plugin
    {"neovim/nvim-lspconfig"},
})

-- 🌟 NOW Load Other Config Files (after Lazy.nvim is loaded)

require('my_config.plugins')   -- Plugin Configurations


-- 🌟 Setup Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "python", "c", "vim", "bash"},  -- Install Parsers
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

-- 🌟 Theme Setup
local status_ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-night')
if not status_ok then
    vim.cmd('colorscheme gruvbox')
end

