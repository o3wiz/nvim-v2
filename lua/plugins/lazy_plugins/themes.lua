return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        enabled = false,
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        name = "github-nvim-theme",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require("github-theme").setup({})
            vim.cmd.colorscheme "github_dark_dimmed"
        end,
    },
}
