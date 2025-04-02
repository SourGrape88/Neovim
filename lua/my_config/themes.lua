-- Themes --

-- Plugins --
require("lazy").setup({
        
            -- Color Buddy 
    { "tjdevries/colorbuddy.nvim", priority = 1000 },

    -- Gruvbox
    { "morhetz/gruvbox", priority = 1000 },

    -- Tokyo Night
    {
    "folke/tokyonight.nvim",
    lazy = false,    -- Load the theme immediately
    priority = 1000, -- Load it before other plugins
    config = function()
        vim.cmd("colorscheme tokyonight-night")
    end
    },

    -- Everforest
    {
    'sainnhe/everforest',
     lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
    end
    },
    
    -- Aurora
    {
    'ray-x/aurora',
    init = function()
    vim.g.aurora_italic = 1
    vim.g.aurora_transparent = 1
    vim.g.aurora_bold = 1
    end,
    config = function()
        vim.cmd.colorscheme "aurora"
        -- override defaults
        vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
    end
    },
        

})
