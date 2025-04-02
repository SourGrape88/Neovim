-- Plugins --
require("lazy").setup({

    -- File Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("neo-tree").setup({})
        end
    },

    -- Syntax Highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Language Server Protocol (LSP)
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
        config = function()
            require("telescope").setup({})
        end
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end
    },

    -- [[ Themes ]]
    { "tjdevries/colorbuddy.nvim", priority = 1000 },

    { "morhetz/gruvbox", priority = 1000 },

    {
        "folke/tokyonight.nvim",
        lazy = false,    -- Load the theme immediately
        priority = 1000, -- Load it before other plugins
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end
    },

     -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'gruvbox',
                    section_separators = {left = '?', right = '*'},
                    component_separators = {left = '|', right = '|'},
                }
            }
        end,
        -- Force Lualine to Load
        lazy = false
    },
})

