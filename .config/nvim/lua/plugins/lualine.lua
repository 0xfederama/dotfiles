return {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        }
    end
}
