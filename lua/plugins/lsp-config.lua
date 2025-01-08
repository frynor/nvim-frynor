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
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.offsetEncoding = { "utf-16" }

		        local custom_hover = function(_, result, ctx, config)
			    config = config or {}
			    config.border = "rounded"
			    
			    local bufnr, winnr = vim.lsp.handlers.hover(_, result, ctx, config)

			    if winnr then
				local normal_bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
				
				vim.api.nvim_set_hl(0, 'LspFloatWinBg', {
				    bg = normal_bg,
				    ctermbg = 'Black'
				})
				
				vim.api.nvim_win_set_option(winnr, 'winhighlight', 'Normal:LspFloatWinBg')
				vim.cmd('redraw!')
			    end
			    
			    return bufnr, winnr
			end

			vim.lsp.handlers["textDocument/hover"] = custom_hover

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
				cmd = {
					"clangd",
					"--offset-encoding=utf-16"
				}
				-- Add similar settings for clangd if needed
			})

			-- Setting hover window border style
			--[[ vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				style = 'normal',
				winblend = 100,
			}) --]]

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to buffer definition" })
			vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, { desc = "Fix action "})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename buffer "})
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
		end,
	},
}
