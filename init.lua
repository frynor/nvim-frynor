vim.g.mapleader = " "
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/packer/start/lazy.nvim")
local lazy = require("lazy")
local opts = {}
lazy.setup("plugins")
vim.wo.number = true
vim.wo.relativenumber = true

-- More comprehensive indentation settings
vim.opt.cindent = true
vim.opt.cinoptions = ':0,l1,t0,g0,(0'
vim.opt.indentexpr = ''
vim.opt.smartindent = false  -- Disable smartindent
vim.opt.autoindent = false   -- Disable autoindent

-- Alternative: create a specific autocommand for C++ files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "c" },
    callback = function()
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = ':0,l1,t0,g0,(0'
        vim.opt_local.indentexpr = ''
     end,
})

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_color = "#FFFFFF"  -- Set cursor color
vim.opt.guicursor = "n:block-blinkon500,v:-blinkon500"
vim.cmd('colorscheme dracula')

