 return {
	"rose-pine/neovim",
	name = "rose-pine",

	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
} 



--[[ return {
	"Mofiqul/dracula.nvim",
	config = function()
		require("dracula").setup({
			transparent_bg = false,
		})
		vim.cmd("colorscheme dracula")
	end,
} --]]

--[[ return {
	'rebelot/kanagawa.nvim',
	config = function()
		vim.opt.background = "dark"

		require("kanagawa").setup({
			theme = "dark",

			background = {
				dark = "dragon",
				light = "lotus"
			},
			terminalColors = true,

			 overrides = function(colors)
				 local theme = colors.theme
				 return {
					 ["@namespace.std"] = { fg = theme.syn_type },
					 ["@operator.cpp"] = { fg = theme.syn_operator },
					 ["@type.std"] = { fg = theme.syn_type },
				 }
			 end,
		})
		vim.cmd("colorscheme kanagawa")
	end,
} --]]
