require "nvchad.mappings"

-- add yours here
local nomap = vim.keymap.del

nomap("n", "<leader>ff")
nomap("n", "<leader>fb")
nomap("n", "<leader>fw")
nomap("n", "<leader>fa")
nomap("n", "<leader>fm")
nomap("n", "<leader>fh")
nomap("n", "<leader>fo")
nomap("n", "<leader>fz")
nomap("n", "<leader>b")
nomap("n", "<leader>gt")
nomap("n", "<leader>q")
nomap("n", "<leader>e")
nomap("n", "<leader>x")

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>g", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>s", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
map("n", "<leader>p", "<cmd>lua require('telescope').extensions.possession.list()<cr>")

map("n", "gt", "<cmd>Telescope git_status<cr>")
map("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>")
map("n", "gE", "<cmd>Telescope diagnostics<cr>")
map("n", "ge", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>")


map("n", "<s-l>", "<cmd>tabnext<cr>")
map("n", "<s-h>", "<cmd>tabprev<cr>")

map("n", "<leader>xx", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>xb", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })
map("n", "<leader>xc", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("i", "jk", "<ESC>")

map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
