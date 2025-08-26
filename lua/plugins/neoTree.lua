return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        opts = function()
            vim.keymap.set("n", "<leader>e", "<Cmd>Neotree float toggle<CR>")
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_status = "NC",
                enable_git_status = true,
                default_component_configs = {
                    container = {
                        enable_character_fade = true,
                    },
                    indent = {
                        indent_size = 2,
                        padding = 1,
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        highlight = "NeoTreeIndentMarker",
                        with_expanders = nil,
                        expander_collapsed = "",
                        expander_expanded = "",
                        expander_highlight = "NeoTreeExpander",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "󰜌",
                        provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                            if node.type == "file" or node.type == "terminal" then
                                local success, web_devicons = pcall(require, "nvim-web-devicons")
                                local name = node.type == "terminal" and "terminal" or node.name
                                if success then
                                    local devicon, hl = web_devicons.get_icon(name)
                                    icon.text = devicon or icon.text
                                    icon.highlight = hl or icon.highlight
                                end
                            end
                        end,
                        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                        -- then these will never be used.
                        default = "*",
                        highlight = "NeoTreeFileIcon",
                    },
                    modified = {
                        symbol = "[+]",
                        highlight = "NeoTreeModified",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added = "✚", -- or "✚"
                            modified = "", -- or ""
                            deleted = "✖", -- this can only be used in the git_status source
                            renamed = "󰁕", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored = "",
                            unstaged = "󰄱",
                            staged = "",
                            conflict = "",
                        },
                    },
                },
            })
        end,
        init = function()
            -- Отключаем netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
    }
}
