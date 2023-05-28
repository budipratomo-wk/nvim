syntax on
set relativenumber
set so=20
set cursorline
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set cmdheight=1
set updatetime=300
set splitright 
set splitbelow
set termguicolors

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim','dart','go']

call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'sainnhe/everforest'            "Theme"
Plug 'morhetz/gruvbox'
Plug 'rose-pine/neovim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Mofiqul/adwaita.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'raphamorim/lucario'
Plug 'fenetikm/falcon'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'dstein64/vim-startuptime'

"LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'        "LSP Installer'"
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Utilities
Plug 'ggandor/leap.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'mhinz/vim-startify'
Plug 'crispgm/nvim-tabline'
Plug 'nvim-tree/nvim-tree.lua'
"Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/neodev.nvim'
"
"Editing
Plug 'windwp/nvim-autopairs' "Add new row automatically when new line in brackets"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"Visual addons
" Plug 'sunjon/shade.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'Pocco81/true-zen.nvim'




call plug#end()

"==============================================================================
" THEMES
"==============================================================================
" set bg=light
" colorscheme gruvbox
" colorscheme monokai_pro
" colorscheme lucario
" colorscheme falcon
" colorscheme nord
" let g:everforest_background = 'soft'
" colorsche kanagawa
colorscheme everforest

" colorscheme rose-pine
"
" let g:adwaita_darker = v:true " for darker version
" let g:adwaita_disable_cursorline = v:true " to disable cursorline
" colorscheme adwaita
"==============================================================================
" GENERAL KEY BINDINGS (No plugins )
"==============================================================================

"keybindings for editing
inoremap jk <ESC>
let mapleader=" "
"switch tabs 
nnoremap H gT
nnoremap L gt
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap no :nohl<CR>

"==============================================================================
" LSP KEY BINDINGS
"==============================================================================

" Show hover
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <Cmd>lua vim.lsp.buf.rename()<CR>
" Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
" Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <leader>lf <Cmd>lua vim.lsp.buf.format({async = true})<CR>
" Diagnostics

nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>

" LSP pickers
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <Cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <Cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap ge <Cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>
nnoremap gE <Cmd>lua require('telescope.builtin').diagnostics()<CR>
nnoremap gim <Cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gs <Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap gS <Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>



"==============================================================================
" TELESCOPE KEY BINDINGS
"==============================================================================
"Pickers
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>g <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>b <Cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>y <Cmd>lua require('telescope.builtin').search_history()<CR>
nnoremap <leader>m <Cmd>lua require('telescope.builtin').resume()<CR>

"==============================================================================
" NVIM TREE
"==============================================================================
nnoremap <leader>xb  :NvimTreeFindFile<CR>
nnoremap <leader>xx  :NvimTreeToggle<CR>

"==============================================================================
" DEBUGGING
"==============================================================================

nnoremap <leader>db  <cmd>lua require('dap').toggle_breakpoint()<CR>
nnoremap <leader>dc  <cmd>lua require('dap').continue()<CR>
nnoremap <leader>do  <cmd>lua require('dap').step_over()<CR>
nnoremap <leader>di  <cmd>lua require('dap').step_into()<CR>
nnoremap <leader>de  <cmd>lua require('dap').repl.open()<CR>
nnoremap <leader>dp  <cmd>lua require('dapui').repl.toggle()<CR>





lua <<EOF
--=============================================================================
--INITIALIZATIONS
--=============================================================================
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})
require("true-zen").setup{}
require("nvim-autopairs").setup {}
require('leap').add_default_mappings()
require('rose-pine').setup({
dark_variant = 'dawn'

})

require("dapui").setup()
require('dap-go').setup()
require('dap.ext.vscode').load_launchjs()
local dap, dapui =require("dap"),require("dapui")
require('lualine').setup{
options={
theme= "everforest",
}
}
require("toggleterm").setup{
-- size=60,
open_mapping= [[<c-t>]],
direction='float'
}


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
--=============================================================================
-- TREESITTER
--=============================================================================

 require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust","dart","eex",
            "elixir",
            "erlang",
            "heex",
            "html",
            "surface", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
--=============================================================================
-- LSP 
--=============================================================================
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('lspconfig')['dartls'].setup{}
require('lspconfig')['html'].setup{
filetypes = {"html","eex","heex"}
}
require('lspconfig')['emmet_ls'].setup{
filetypes = {"ex","eex","heex"}
}
require('lspconfig')['elixirls'].setup{
filetypes = {"ex","eex","heex"}
}


--=============================================================================
-- TELESCOPE
--=============================================================================
local present, telescope = pcall(require, "telescope")

if not present then
   return
end
local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "> ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.90,
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    winblend = 0,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
 },
}

   telescope.setup(options)

   local extensions = { "themes", "terms", "fzf"}

   pcall(function()
      for _, ext in ipairs(extensions) do
         telescope.load_extension(ext)
      end
   end)

--=============================================================================
-- DEBUGGING
--=============================================================================
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}

dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
