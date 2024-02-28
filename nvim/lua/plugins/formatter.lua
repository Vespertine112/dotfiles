return {
    "mhartington/formatter.nvim",
    cmd = { "FormatWrite" },
    event = { "BufWritePost" },
    config = function ()
        local util = require("formatter.util")
        local prettier = function(parser)
            return {
                exe = "prettier",
                args = {
                    "--tab-width 4",
                    "--stdin-filepath",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--parser",
                    parser,
                },
                stdin = true,
                try_node_modules = true,
            }
        end

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup {
            logging = false,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                javascript = {prettier},
                typescript = {prettier},
                json = {prettier},
                html = {prettier},
                css = {prettier},
                graphql = {prettier},
                markdown = {prettier},
                yaml = {prettier},
                yml = {prettier},
                vue = {prettier},
                svelte = {prettier},

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                ["*"] = {
                    -- "formatter.filetypes.any" defines default configurations for any
                    -- filetype
                    require("formatter.filetypes.any").remove_trailing_whitespace
                }
            },
        }
    end

}
