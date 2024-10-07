return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")
		vim.opt.termguicolors = true
		vim.opt.mousemoveevent = true	

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				show_buffer_close_icons = true,
				tab_size = 20,
				highlight_current_buffer = true,
        			hover = {
            				enabled = true,
            				delay = 200,
            				reveal = {'close'},
        			},
			}
		})

		vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<Leader>bd', ':bdelete<CR>', { noremap = true, silent = true })


	end,
}
