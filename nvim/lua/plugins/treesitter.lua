-- Treesitter: new API (Neovim 0.12+), with auto-install on file open.
local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- Eagerly installed languages (never block on first open).
		ts.install({
			"c", "lua", "vim", "vimdoc", "query",
			"elixir", "heex",
			"typescript", "javascript", "html", "svelte",
		})

		-- Auto-install parser + start highlighting for any filetype.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = args.match
				local lang = vim.treesitter.language.get_lang(ft) or ft

				-- Parser already present -> just start highlighting.
				if pcall(vim.treesitter.start, args.buf, lang) then
					return
				end

				-- No parser exists for this filetype (e.g. "notify" popups) -> nothing to do.
				if not require("nvim-treesitter.parsers")[lang] then
					return
				end

				-- Otherwise install it, then start.
				local ok, task = pcall(ts.install, { lang })
				if ok and task then
					task:wait(30000)
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})
	end,
}
return { M }
