return	{ 
		"neanias/everforest-nvim",
	   	version = false,
	   	lazy = false, 
	   	priority = 1000,
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
		config = function()
			vim.cmd.colorscheme "everforest"
	end
}
