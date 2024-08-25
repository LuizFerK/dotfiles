local keymap = vim.keymap

return {
  'stevearc/oil.nvim',
  opts = {},
  config = function(_, opts)
    require("oil").setup(opts)

    local keyopts = { noremap = true, silent = true }
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", keyopts)
  end
}
