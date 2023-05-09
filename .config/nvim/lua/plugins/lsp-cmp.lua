return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.preset('recommended')

            lsp.setup_nvim_cmp({
                preselect = 'none',
                completion = {
                    completeopt = 'menu,menuone,preview,noinsert,noselect'
                },
            })

            lsp.ensure_installed({
                'lua_ls'
            })

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_action = require('lsp-zero').cmp_action()
            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    }),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<Esc>"] = cmp.mapping.close(),
                }
            })

            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = '[F]ormat current buffer' }) -- format current file

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({
                    buffer = bufnr,
                    preserve_mappings = false,
                })
                local opts = { buffer = bufnr, remap = false, desc = "test" }

                opts.desc = "[G]o to [D]efinition";
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                opts.desc = "Show codelens";
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                opts.desc = "Show symbol in wors[S]pace";
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                opts.desc = "Open [D]iagnostics";
                vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
                opts.desc = "Next diagnostic";
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                opts.desc = "Prev diagnostic";
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                opts.desc = "[C]ode [A]ctions";
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                opts.desc = "[V]ariable [R]eferences";
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                opts.desc = "[V]ariable [R]e[N]ame";
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                opts.desc = "Get signature [HELP]";
                vim.keymap.set("n", "<leader>help", function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    },
}
