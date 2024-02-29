return  {
    'akinsho/toggleterm.nvim',
    version = "*",
    init = function()
        if package.config:sub(1,1) == "\\" then
            local powershell_options = {
                shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
                shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
                shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
                shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
                shellquote = "",
                shellxquote = "",
            }

            for option, value in pairs(powershell_options) do
                vim.opt[option] = value
            end 
        end
    end,
    opts = { 
        terminal_mappings = true,
        direction = "horizontal",
        close_on_exit = true,
        auto_scroll = true,
        open_mapping = [[<c-j>]],
    },
}
