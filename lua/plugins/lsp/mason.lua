return {
    {
        "williamboman/mason-lspconfig.nvim",
        name = "mason-lspconfig",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        name = "mason-null-ls",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "prettier",
                "stylua",
                "black",
                "clang-format",
            }
        },
    },
    {
        "williamboman/mason.nvim",
        name = "mason",
        dependencies = {
            "mason-lspconfig",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            mason.setup({})
            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "rust_analyzer",
                    "tsserver"
                },
                automatic_installation = true,
            })
        end,
    }
}
