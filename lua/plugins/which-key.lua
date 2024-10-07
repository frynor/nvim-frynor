return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	
	config = function()
		local whichKey = require("which-key")
		whichKey.setup({})
	end,
}
