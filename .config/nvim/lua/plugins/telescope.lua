return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        }

        -- See `:help telescope.builtin`
        local telescope_builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = "[P]roject [F]ile search" })
        vim.keymap.set('n', '<leader>pg', telescope_builtin.git_files, { desc = "[P]roject [G]it file search" })
        vim.keymap.set('n', '<leader>ps', telescope_builtin.live_grep, { desc = "[P]roject [S]earch with grep" })
        vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
        -- vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
        -- vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
        -- vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Search in current buffer' })
    end
}
