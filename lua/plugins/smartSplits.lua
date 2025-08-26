local term = vim.trim((vim.env.TERM_PROGRAM or ""):lower())
local mux = term == "tmux" or term == "wezterm" or vim.env.KITTY_LISTEN_ON

return {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
    config = function()
        local ss = require("smart-splits")

        vim.keymap.set('n', '<C-H>', ss.move_cursor_left, { desc = 'Move to left split' })
        vim.keymap.set('n', '<C-J>', ss.move_cursor_down, { desc = 'Move to down split' })
        vim.keymap.set('n', '<C-K>', ss.move_cursor_up, { desc = 'Move to up split' })
        vim.keymap.set('n', '<C-L>', ss.move_cursor_right, { desc = 'Move to right split' })
        vim.keymap.set('n', '<C-Up>', ss.resize_up, { desc = 'Resize split up' })
        vim.keymap.set('n', '<C-Down>', ss.resize_down, { desc = 'Resize split down' })
        vim.keymap.set('n', '<C-Left>', ss.resize_left, { desc = 'Resize split left' })
        vim.keymap.set('n', '<C-Right>', ss.resize_right, { desc = 'Resize split right' })
    end
}
