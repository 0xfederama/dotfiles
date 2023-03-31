return {

    {
        -- Open a prompt for <leader> commands
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
            require("which-key").setup {
            }
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                signs = false,
            }
        end
    },

    'theprimeagen/vim-be-good',
    'theprimeagen/harpoon',

    'lewis6991/gitsigns.nvim',

    {
        'romgrk/barbar.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            -- lazy.nvim can automatically call setup for you. just put your options here:
            animation = false,
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- themes
    'navarasu/onedark.nvim', -- Theme inspired by Atom
    'sainnhe/gruvbox-material',
    { 'rose-pine/neovim', name = 'rose-pine' },

    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    'numToStr/Comment.nvim',               -- "gc" to comment visual regions/lines
    'm4xshen/autoclose.nvim',              -- auto close brackets

    'stevearc/dressing.nvim',              -- Dressing UI for legendary
    {
        'mrjones2014/legendary.nvim',
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = 'kkharji/sqlite.lua'
    },

}
