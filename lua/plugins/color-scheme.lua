return {
    -- Rose Pine colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
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
        end,
    },
    -- Dracula colorscheme
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        config = function()
            require("dracula").setup({
                colors = { bg = "#000000" },
                transparency = true,
                extend_background_behind_borders = true,
                dim_inactive_windows = false,
            })
        end,
    },
    -- Kanagawa colorscheme
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            require("kanagawa").setup({
                background = {
                    dark = "dragon",
                    light = "lotus",
                },
                terminalColors = false,
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        ["@namespace.std"] = { fg = theme.syn_type },
                        ["@operator.cpp"] = { fg = theme.syn_operator },
                        ["@type.std"] = { fg = theme.syn_type },
                    }
                end,
            })
        end,
    },
    -- Gruvbox colorscheme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            require("gruvbox").setup({
                palette_overrides = { bg0 = "#000000" },
                contrast = "hard",
            })
            -- Explicit background overrides
            vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
        end,
    },
    -- Catppuccin colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
		background = {
					dark = "mocha",
				},

		dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
                --[[ custom_highlights = function(colors)
                    return {
                        Normal = { bg = "#000000" },
			NormalNC = { bg = "#000000" },
                        NormalFloat = { bg = "#000000" },
			NormalBorder = { bg = "#000000" },
			FloatBorder = { bg = "#000000" },
                        LineNr = { bg = "#000000" },
                        SignColumn = { bg = "#000000" },
			WinSeperator = { bg = "#000000", fg = "#000000" },

			-- Plugin specific colors
		        TelescopeNormal = { bg = "#000000" },
			TelescopeBorder = { bg = "#000000" },
			NvimTreeNormal = { bg = "#000000" },
			NvimTreeNormalNC = { bg = "#000000" },
                    } 
                end, --]]
                integrations = {
                    cmp = true,
                    gitsigns = true,
		    telescope = { enabled = true, style = "mocha" },
		    nvimtree = { enabled = true, transparent_panel = false },
                },
            })
        end,
    },

	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night"
			})
		end,
	}
}

