return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "python",
                "vimdoc",
                "c",
                "cpp",
                "rust",
                "javascript",
                "typescript",
            },
            highlight = {
                additional_vim_regex_highlighting = true,
                enable = true,
            },
            incremental_selection = {
                enable = true,
                indent = {
                    enable = true
                },
                keymaps = {
                    init_selection = "<cr>",
                    node_decremental = "<bs>",
                    node_incremental = "<cr>",
                },
            },
            indent = {
                enable = true
            }
        })
    end,
}
