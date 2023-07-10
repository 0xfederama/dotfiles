return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- opts = { require'alpha.themes.startify'.config }
    config = function()
        local config = require 'alpha.themes.theta'.config

        local startify = require('alpha.themes.startify')
        local devicons = require('nvim-web-devicons')
        local lazy = require('lazy')

        local function info_value()
            local total_plugins = lazy.stats().count
            local datetime = os.date(" %d-%m-%Y    ")
            local version = vim.version()
            local nvim_version_info = devicons.get_icon_by_filetype('vim', {})
                .. ' v'
                .. version.major
                .. '.'
                .. version.minor
                .. '.'
                .. version.patch

            return datetime .. '⚡' .. total_plugins .. ' plugins    ' .. nvim_version_info
        end

        local info = {
            type = 'text',
            val = info_value(),
            opts = {
                hl = 'comment',
                position = 'center',
            },
        }

        local stats = {
            type = 'group',
            val = {
                { type = "padding", val = 1 },
                info,
                { type = "padding", val = 2 },
            },
            opts = {
                position = 'center',
            }
        }

        -- local mru = {
        --     type = 'group',
        --     val = {
        --         {
        --             type = 'text',
        --             val = 'Recent files',
        --             opts = {
        --                 hl = 'SpecialComment',
        --                 shrink_margin = false,
        --                 position = 'center',
        --             },
        --         },
        --         { type = 'padding', val = 1 },
        --         {
        --             type = 'group',
        --             val = function()
        --                 return { startify.mru(1, vim.fn.getcwd(), 10) }
        --             end,
        --             opts = {
        --                 position = 'center',
        --             }
        --         },
        --     },
        --     opts = {
        --         position = 'center',
        --     },
        -- }

        local dashboard = require("alpha.themes.dashboard")
        local buttons = {
            type = "group",
            val = {
                { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("f", "  > Search file", ":Telescope find_files<CR>"),
                dashboard.button("t", "  > Search text", ":Telescope live_grep<CR>"),
                dashboard.button("r", "  > Recents", ":Telescope oldfiles<CR>"),
                dashboard.button("p", "  > Update", ":Lazy update<CR>"),
                dashboard.button("s", "  > Settings", ":e ~/.config/nvim/<CR>"),
                dashboard.button("q", "  > Quit", ":qa<CR>"),
            },
            position = "center",
        }

        config.layout[3] = stats
        -- config.layout[4] = mru
        config.layout[6] = buttons

        require 'alpha'.setup(config)

        -- require 'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
