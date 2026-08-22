-- Provide quick start configs for NVIM LSP
-- LSPs installed via mason are automatically enabled via mason-lspconfig
return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Lsp Code Actions" })
				vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, { buffer = args.buf, desc = "Lsp Find References" })
			end,
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_enable = true,
		})

		-- qmlls: use the system binary instead of mason's, so the language
		-- server is built against the same Qt as your local projects. Mason's
		-- qmlls ships its own Qt build; a mismatch against the Qt your QML
		-- imports resolve against causes errors on built projects.
		local qmlls = vim.fn.exepath("qmlls6")
		if qmlls == "" then
			qmlls = vim.fn.exepath("qmlls")
		end
		if qmlls ~= "" then
			vim.lsp.config("qmlls", {
				cmd = { qmlls, "-E" }, -- -E: resolve modules via QML_IMPORT_PATH
			})
			vim.lsp.enable("qmlls")
		end
	end,
}
