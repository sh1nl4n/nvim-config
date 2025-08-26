return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = { enable = true },
	    indent = { enable = true},
	    autotage = { enable = true },
	    ensure_installed = {
		"lua",
		"tsx",
		"typescript",
		"javascript",
		"markdown",
		"css",
		"dockerfile",
		"editorconfig",
		"go",
		"graphql",
		"html",
		"json",
		"nginx",
		"proto",
		"ruby",
		"scss",
		"sql",
		"svelte",
		"vue",
		"xml",
		"yaml",
	    },
	    auto_install = false
	})
    end
}
