return {
    {
        "hrsh7th/cmp-buffer",
        name = "cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
        name = "cmp-path",
    },
    {
        "L3MON4D3/LuaSnip",
        name = "LuaSnip",
        version = "v2.2.0",
        build = "make install_jsregexp",
    },
    {
        "saadparwaiz1/cmp_luasnip",
        name = "cmp_luasnip",
    },
    {
        "rafamadriz/friendly-snippets",
        name = "friendly-snippets",
    },
    {
        "onsails/lspkind.nvim",
        name = "lspkind",
    },
    {
        "hrsh7th/nvim-cmp",
        name = "nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "lspkind",
            "friendly-snippets",
            "cmp_luasnip",
            "LuaSnip",
            "cmp-path",
            "cmp-buffer",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            lspkind.init({})
            luasnip.config.set_config({
                history = false,
                updateevents = "TextChanged,TextChangedI"
            })
            cmp.setup({
                completion = {
                    completeopt =  "menu,menuone,noselect",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = {
                    {name = "nvim_lsp"},
                    {name = "luasnip"},
                    {name = "buffer"},
                    {name = "path"},
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm {
                            behavior = cmp.SelectBehavior.Insert,
                            select = true,
                        },
                        {"i", "c"}
                    ),
                },
            })
            local function SetCompleteKeymap(modes, shortcut, cmpCommand)
                opts = { silent = true, }
                vim.keymap.set(modes, shortcut, cmpCommand, opts)
            end
            vim.opt.shortmess:append "c"
            SetCompleteKeymap({"i", "s"}, "<C-k>", function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end)
            SetCompleteKeymap({"i", "s"}, "<C-j>", function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end)
        end,
    }
}
