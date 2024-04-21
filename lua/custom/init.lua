vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.lua", "*.dart", },
  command = "lua vim.lsp.buf.format()"
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  command = "lua require('telescope').extensions.possession.list() "
})
