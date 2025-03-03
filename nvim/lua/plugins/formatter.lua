-- In-house formatting
return {
	"mhartington/formatter.nvim",
	cmd = { "FormatWrite", "Format" },
	event = { "BufWritePost" },
	config = function()
		local util = require("formatter.util")
		local prettier = function(parser)
			return {
				exe = "prettier",
				args = {
					"--tab-width 4",
					"--print-width 180",
					"--stdin-filepath",
					"--use-tabs",
					util.escape_path(util.get_current_buffer_file_path()),
					"--parser",
					parser,
				},
				stdin = true,
				try_node_modules = true,
			}
		end
		local gofumpt = function(parser)
			return {
				exe = "gofumpt",
				stdin = true,
			}
		end

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			logging = false,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				javascript = { prettier },
				typescript = { prettier },
				json = { prettier },
				html = { prettier },
				css = { prettier },
				scss = { prettier },
				graphql = { prettier },
				markdown = { prettier },
				yaml = { prettier },
				yml = { prettier },
				vue = { prettier },
				svelte = { prettier },
				go = { gofumpt },

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
				},
			},
		})
	end,
}
