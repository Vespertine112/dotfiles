return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find Files" },
		{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = "Live Grep" },
		{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = "Buffers" },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = "Help Tags" },
		{
			'<leader>ps',
			function ()
			local ts = require("telescope.builtin")
				ts.grep_string({ search = vim.fn.input("Grep > ")}) 
			end,
			desc = "Grep String"
		}
	},
}
