return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        name = "telescope-fzf-native",
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        name = "telescope-ui-select"
    },
    {
        "nvim-tree/nvim-web-devicons",
        name = "nvim-web-devicons",
        enabled = vim.g.have_nerd_font
    },
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        event = "VimEnter",
        dependencies = {
            "plenary",
            "telescope-fzf-native",
            "telescope-ui-select",
            "nvim-web-devicons",
        },
        config = function()
            local telescopeActions = require("telescope.actions")
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "󱞪 ",
                    mappings = {
                        i = {
                            ["<C-j>"] = telescopeActions.move_selection_next,
                            ["<C-k>"] = telescopeActions.move_selection_previous,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    live_grep = {
                        theme = "ivy",
                    }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            local builtin = require("telescope.builtin")
            local function SetTelescopeKeymap(modes, shortcut, telescopeCommand, desc)
                opts = {
                    silent = true,
                    noremap = true,
                    desc = desc,
                }
                opts.desc = desc
                vim.keymap.set(modes, shortcut, telescopeCommand, opts)
            end
            SetTelescopeKeymap({"n"}, "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
            SetTelescopeKeymap({"n"}, "<leader>sf", builtin.find_files, "[S]earch [F]iles")
            SetTelescopeKeymap({"n"}, "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
            SetTelescopeKeymap({"n"}, "<leader>s.", builtin.oldfiles, "[S]earch Recent Files ('.' for repeat)")
            SetTelescopeKeymap({"n"}, "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
            SetTelescopeKeymap({"n"}, "<leader>sn", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end, "[S]earch [N]eovim files")
            SetTelescopeKeymap({"n"}, "<leader>gT", builtin.lsp_type_definitions, "[L]SP [G]oto [T]ype definitions")
            SetTelescopeKeymap({"n"}, "<leader>gd", builtin.lsp_definitions, "[L]SP [G]oto [D]efinitions")
            SetTelescopeKeymap({"n"}, "<leader>gr", builtin.lsp_references, "[L]SP [G]oto [R]eferences")
            SetTelescopeKeymap({"n"}, "<leader>ds", builtin.lsp_document_symbols,  "[L]SP [D]ocument [S]ymbols" )
            SetTelescopeKeymap({"n"}, "<leader>ws", builtin.lsp_dynamic_workspace_symbols,  "[L]SP [W]orkspace [S]ymbols" )
        end
    }
}
