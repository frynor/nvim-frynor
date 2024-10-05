return { 
	"nvim-telescope/telescope.nvim", 
	dependencies = { "tsakirist/telescope-lazy.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
}
