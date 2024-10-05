vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/packer/start/lazy.nvim")

local lazy = require("lazy")

local opts = {}

lazy.setup("plugins")


local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "cpp"},
	highlight = { enable = true },
	indent = { enable = true },
})

require("everforest").setup({
	background = "hard",
	transparent_background_level = 0,
	italics = true,
	disable_italic_comments = false,
	sign_column_background = "none",
	ui_contrast = "low",
	dim_inactive_windows = false,
	diagnostic_text_highlight = true,
	diagnostic_virtual_text = "coloured",
	spell_foreground = false,
})
vim.cmd.colorscheme "everforest"
