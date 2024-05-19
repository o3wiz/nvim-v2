local function setKeymap(modes, shortcut, command, opts, desc)
    opts = opts or {}
    opts["desc"] = desc
    vim.keymap.set(modes, shortcut, command, opts)
end
local opts = {
    silent = true,
    noremap = true,
}
-- Buffer navigation
setKeymap({"n"}, "<S-h>", "<cmd>bprevious<cr>", opts, "previous buffer")
setKeymap({"n"}, "<S-l>", "<cmd>bprevious<cr>", opts, "next buffer")
-- Diagnostic keymaps
setKeymap({"n"}, "[d", vim.diagnostic.goto_prev, opts, "previous [D]iagnostic")
setKeymap({"n"}, "]d", vim.diagnostic.goto_next, opts, "next [D]iagnostic")
setKeymap({"n"}, "<leader>e", vim.diagnostic.open_float, opts, "diagnostic [E]rror")
setKeymap({"n"}, "<leader>q", vim.diagnostic.setloclist, opts, "[Q]uickfix")
-- NetRW
setKeymap({"n"}, "<leader>E", "<cmd>Vex 30<cr>", opts, "Explorer on the left")
-- Indentation
setKeymap({"v"}, "<", "<gv", opts, "visual untab")
setKeymap({"v"}, ">", ">gv", opts, "visual tab")
