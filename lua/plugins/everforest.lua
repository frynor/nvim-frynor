return { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- Set the colorscheme
        vim.cmd.colorscheme("catppuccin-mocha")
    end
}

