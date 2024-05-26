return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            lua = { "stylua" },
            python = { "black" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
    },
    keys = {
        { mode = {"v", "n"}, "<space>ff", function()
            require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
        end, desc = "[F]ormat [F]ile", silent = true },
    },
}
