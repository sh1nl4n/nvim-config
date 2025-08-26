return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = function()
                return math.floor(vim.o.lines * 0.7) -- 70% высоты
            end,
            open_mapping = [[<c-\>]],                -- Ctrl+\ — быстрое открытие/закрытие
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float", -- 🔥 плавающее окно
            close_on_exit = true,
            shell = vim.o.shell,
        })

        -- Команда для запуска lazygit в float-терминале
        local function open_lazygit()
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir", -- открывается в корне git-репозитория
                direction = "float",
                float_opts = {
                    border = "rounded",
                    highlights = {
                        border = "FloatBorder",
                        background = "Normal",
                    },
                },
                on_open = function(term)
                    vim.cmd("startinsert!")
                    -- Закрыть терминал по нажатию <Esc> или q
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>",
                        { noremap = true, silent = true })
                end,
                on_exit = function()
                    vim.cmd("NormalMode")
                end,
            })
            lazygit:toggle()
        end

        -- Назначаем <leader>gg
        vim.keymap.set("n", "<leader>gg", open_lazygit, { desc = "Open lazygit in floating terminal" })
    end
}
