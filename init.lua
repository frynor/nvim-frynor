vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/packer/start/lazy.nvim")

local lazy = require("lazy")

local opts = {}

lazy.setup("plugins")

vim.wo.number = true
vim.wo.relativenumber = true

