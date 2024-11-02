return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip") 
			local s = luasnip.snippet
			local t = luasnip.text_node
			
			-- Define custom HTML snippet
			luasnip.add_snippets("html", {
				s("!", {
					t({
						"<!DOCTYPE html>",
						"<html lang=\"en\">",
						"<head>",
						"    <meta charset=\"UTF-8\">",
						"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
						"    <title>Document</title>",
						"</head>",
						"<body>",
						"    ",
						"</body>",
						"</html>",
					}),
				}),
			})

			luasnip.add_snippets("cpp", {
				s("!!", {
					t({
						"#include <iostream>",
						"",
						"int main(int argc, char* argv[]) {",
						"",
						"	return 0;",
						"}",
					}),
				}),
			})

			-- Load all snippets from friendly-snippets, including CSS
			require("luasnip.loaders.from_vscode").lazy_load()

			-- nvim-cmp setup
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, 
					{ name = "luasnip" }, -- Ensure LuaSnip is included
				}, {
					{ name = "buffer" },  -- This adds buffer completions
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",  -- Ensure this is installed
		},
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
}
