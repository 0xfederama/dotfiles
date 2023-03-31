return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",
    keys = {
        { "<leader>pt", "<cmd>Neotree toggle<cr>", desc = "[P]roject Neo[T]ree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        filesystem = {
            follow_current_file = true,
            hijack_netrw_behavior = "open_current",
        },
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                nowait = true,
            },
        }
    },
}
