return {

    {
        -- open a prompt for <leader> commands
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

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
        end
    },

    -- themes
    'navarasu/onedark.nvim',
    'sainnhe/gruvbox-material',
    'rose-pine/neovim',
    'gbprod/nord.nvim',

    {
        'lukas-reineke/indent-blankline.nvim', -- add indentation guides even on blank lines
        version = "2.20.8",
        config = function()
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help indent_blankline.txt`
            require('indent_blankline').setup {
                -- char = '┊',
                show_trailing_blankline_indent = true,
            }
        end,
    },

    'm4xshen/autoclose.nvim', -- auto close brackets
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                -- normal mode
                toggler = {
                    line = '<leader>c',
                    block = '<leader>bc',
                },
                -- visual mode
                opleader = {
                    line = '<leader>c',
                    block = '<leader>bc',
                }
            }
        end
    },

    'stevearc/dressing.nvim', -- dressing UI for legendary
    {
        'mrjones2014/legendary.nvim',
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = 'kkharji/sqlite.lua',
        config = function()
            require('legendary').setup({
                keymaps = {
                    {
                        '<C-p>',
                        { n = ':Legendary<CR>' },
                        description = 'Command [P]alette',
                    },
                },
            })
        end
    },

    'nvim-treesitter/nvim-treesitter-context',

    'ocaml/vim-ocaml',
    'mg979/vim-visual-multi',
    'jubnzv/virtual-types.nvim',
}
