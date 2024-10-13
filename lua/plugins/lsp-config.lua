return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Custom diagnostic configuration
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						if diagnostic.message:match("^Line with empty space only$") then
							return nil
						end
						return diagnostic.message
					end,
				},
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							disable = { "trailing-space" },
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				-- Add similar settings for clangd if needed
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})
		end,
	},
}
