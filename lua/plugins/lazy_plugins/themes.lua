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
        enabled = false,
        config = function()
            require("github-theme").setup({})
            vim.cmd.colorscheme "github_dark_dimmed"
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        enabled = true,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme 'gruvbox'
        end,
    }
}
