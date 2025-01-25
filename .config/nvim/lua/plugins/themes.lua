return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                -- optional configuration here
            })
        end
    },

    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                themes = {"tokyonight-night","catppuccin","vague"},
                livePreview = true,

                vim.keymap.set("n","<leader>th","<CMD>Themery<CR>")
            })
        end
    },
}
