return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function(_, opts)
        local ibl = require("ibl")
        ibl.setup(opts)
    end
}
