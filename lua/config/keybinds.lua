vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Копировать в системный буфер
vim.keymap.set("n", "<C-c>", '"+yy')      -- Ctrl+C: скопировать строку
vim.keymap.set("v", "<C-c>", '"+y')       -- Ctrl+C: в выделении — скопировать
vim.keymap.set("n", "<leader>y", '"+y$')  -- \y: скопировать до конца строки
vim.keymap.set("n", "<leader>Y", '"+yg_') -- \Y: скопировать всю строку (включая пробелы)
