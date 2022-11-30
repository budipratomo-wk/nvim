syntax on
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
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

" Enable inline code in markdown
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim','dart']

"Plugins!
call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'sainnhe/everforest'            "Theme"
Plug 'morhetz/gruvbox'
Plug 'rose-pine/neovim'
Plug 'projekt0n/github-nvim-theme'

"Telescope - most important plugin to navigate. Try out the shortcuts I've put
"in for you in line 137 - 164 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

"LSP & Completions
" These plugins ties the neovim built-in lsp engine with a (required) separate
" completion engine and snippets provider. 
Plug 'neovim/nvim-lspconfig'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'hrsh7th/nvim-cmp'

" Mason helps in installing new lsp. You can use :LspInstall [language]
" whenever you have a new language to code in
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'        "LSP Installer'"

"Better code parsing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dart-lang/dart-vim-plugin'


"Utilities
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'mhinz/vim-startify'
"
"Editing
"Add new row automatically when new line in brackets"
Plug 'windwp/nvim-autopairs' 

"Enable easy toggling of comments 
Plug 'tpope/vim-commentary'

"Enable easy switching of brackets
Plug 'tpope/vim-surround'


"Visual addons
" Put lines to highlight indentation
Plug 'lukas-reineke/indent-blankline.nvim' 
Plug 'TaDaa/vimade'                   "Highlight active window"
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'danilamihailov/beacon.nvim'   "Add visibility when cursor moves"
call plug#end()

"==============================================================================
" THEMES
"==============================================================================
" set bg=light
" colorscheme gruvbox
" colorscheme everforest
colorscheme github_light

"==============================================================================
" GENERAL KEY BINDINGS (No plugins )
"==============================================================================

"keybindings for editing
"so you don't have to press esc
inoremap jk <ESC>

"leader is used whenever there is a <leader> in the keybinding. 
"<leader>gl is equivalent to <space>gl
"
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

"==============================================================================
" LSP KEY BINDINGS
"==============================================================================

"Show documentation. Press q to exit
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>

"Refactor names
nnoremap <leader>rn <Cmd>lua vim.lsp.buf.rename()<CR>

"Code action, similar to VSCode's light bulb
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
" Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

" Similar to ddev format.
nnoremap <leader>fo <Cmd>lua vim.lsp.buf.formatting()<CR>


" Diagnostics
nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ge <Cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>
nnoremap gE <Cmd>lua require('telescope.builtin').diagnostics()<CR>

" LSP navigations 
nnoremap gd <Cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <Cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap gim <Cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap go <Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>


"==============================================================================
" FILE NAVIGATION
"==============================================================================
" Some built in shortcuts are not listed. For example, to open found file in
" a split, use CTRL-V and to open in another tab, use CTRL-T
"
"File picker based on name
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>

"File picker based on content
nnoremap <leader>fg <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>

"Search keyword inside your currently open file
nnoremap <leader>fs <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

"==============================================================================
" Misc keybindings
"==============================================================================
"Open terminal - CTRL-T in normal mode



lua <<EOF
--=============================================================================
--INITIALIZATIONS
--=============================================================================
require("nvim-autopairs").setup {}

require('lualine').setup{
options = { theme = 'github_light' }
}

require("toggleterm").setup{
-- size=60,
open_mapping= [[<c-t>]],
direction='float'
}

--=============================================================================
--INDENT BLANKLINE
--=============================================================================
vim.opt.termguicolors = true
--IndentBlankLine configs
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

--=============================================================================
-- TREESITTER
--=============================================================================

 require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

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
    disable = { "c", "rust" },

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver','dartls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

--=============================================================================
-- SNIPPETS & COMPLETIONS 
--=============================================================================
-- luasnip setup
local ls= require('luasnip')
ls.filetype_extend("all",{"_"})
--
config = function ()
    require'cmp'.setup {
    snippet = {
      expand = function(args)
 ls.lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'luasnip' },
      -- more sources
    },
  }
  end
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
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
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
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
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
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
  extensions_list = { "themes", "terms" },
}
   if override_flag then
      default = require("core.utils").tbl_override_req("telescope", default)
   end

   telescope.setup(options)

   local extensions = { "themes", "terms", "live_grep_args",  "fzf"}

   pcall(function()
      for _, ext in ipairs(extensions) do
         telescope.load_extension(ext)
      end
   end)

