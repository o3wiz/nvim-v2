return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        enabled = true,
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.hi 'Comment gui=none'
        end,
    },
}
