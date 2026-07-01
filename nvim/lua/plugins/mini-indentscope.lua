return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "oil",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
