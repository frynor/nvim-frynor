return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim", 
		"nvim-lua/plenary.nvim",
	},


	config = function()
		local hardTime = require("hardtime")
		hardTime.setup({})
	end
}
