return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
        })

        -- 🔧 Горячие клавиши
        local map = vim.keymap.set
        map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
        map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
        map("n", "<leader>bx", "<Cmd>BufferLinePickClose<CR>", { desc = "Close tab" })
        map("n", "<leader>bt", "<Cmd>BufferLinePick<CR>", { desc = "Pick tab" })
        map("n", "<leader>bb", "<Cmd>BufferLineSortByDirectory<CR>", { desc = "Sort by directory" })
    end
}
