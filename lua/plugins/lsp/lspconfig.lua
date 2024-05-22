return {
    {
        "hrsh7th/cmp-nvim-lsp",
        name = "cmp-nvim-lsp",
    },
    {
        "antosha417/nvim-lsp-file-operations",
        name = "nvim-lsp-file-operations",
        config = true
    },
    {
        "neovim/nvim-lspconfig",
        name = "nvim-lspconfig",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "cmp-nvim-lsp",
            "nvim-lsp-file-operations",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local opts = {noremap = true, silent = true}
            local on_attach = function(client, bufnr)
                -- TODO: set keymaps!
            end
            local capabilities = cmp_nvim_lsp.default_capabilities()
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "E",
                        [vim.diagnostic.severity.WARN] = "W",
                        [vim.diagnostic.severity.INFO] = "I",
                        [vim.diagnostic.severity.HINT] = "H",
                    },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                }
            })
            lspconfig["clangd"].setup({
                cmd = {"/usr/bin/clangd"},
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["rust_analyzer"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["tsserver"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["gopls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    }
}
