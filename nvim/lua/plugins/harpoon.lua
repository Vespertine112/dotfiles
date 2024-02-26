-- This exposes some globals so I can map things correctly. The global vars [Harpoon, ToggleTelescope] are used in:
-- []
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        Harpoon = require('harpoon')
        Harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        function ToggleTelescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():append() end, desc = "harpoon file", },
        { "<C-e>",  function() ToggleTelescope(Harpoon:list()) end, desc = "Harpoon Quick Menu", },
    }
}

