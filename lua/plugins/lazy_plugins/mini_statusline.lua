return {
    "echasnovski/mini.statusline",
    name = "mini-statusline",
    config = function()
        local statusline = require("mini.statusline")
        statusline.setup({
            use_icons = vim.g.have_nerd_font,
            section_location = function()
                return "%2l:%-2v"
            end,
            set_vim_settings = false,
        })
    end
}
