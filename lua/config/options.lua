vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2

-- Настройка netrw: показывать скрытые файлы
vim.g.netrw_list_hide = [[^\.$]]
vim.g.netrw_hide = 0

-- Опционально: улучшить стиль отображения
vim.g.netrw_liststyle = 0 -- 0 = простой список
vim.g.netrw_winsize = 25
