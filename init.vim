syntax on
set so=20
set relativenumber
set cursorline
set nocompatible            " disable compatibility to old-time vi
set clipboard+=unnamedplus 
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

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim','dart','go']

" netrw settings
let g:netrw_keepdir = 0
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3
au FileType netrw nmap <buffer> <C-h> <C-w>h
au FileType netrw nmap <buffer> <C-l> <C-w>l
au FileType netrw nmap <buffer> <C-o> :e#<CR>

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        vert new
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Autoformat on save
autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false })
autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = false })

autocmd BufWritePost *.java !./gradlew :server:spotlessApply
autocmd FileChangedShell *.java e!

autocmd BufWritePost *.dart !make ripformat
autocmd FileChangedShell *.dart e!

call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'sainnhe/everforest'            "Theme"
Plug 'ellisonleao/gruvbox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

"LSP & Completions
Plug 'dart-lang/dart-vim-plugin'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

"Snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

"Utilities
Plug 'ggandor/leap.nvim'
Plug 'mhinz/vim-startify'
Plug 'lewis6991/gitsigns.nvim'

"Editing
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"Visual addons
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()

"==============================================================================
" THEMES
"==============================================================================
set bg=dark
" set bg=light
colorscheme everforest
" colorscheme rose-pine
" colorscheme catppuccin-latte
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
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>

"==============================================================================
" TELESCOPE KEY BINDINGS
"==============================================================================
"Resume last picker
nnoremap <leader>r :Telescope resume<CR>
"Pickers
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

nnoremap <leader><leader> :Telescope<CR>

" LSP pickers
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gf <Cmd>lua require('telescope.builtin').lsp_references({show_line="false", include_declaration=false,fname_width=70, trim_text=true})<CR>
nnoremap ge <Cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>
nnoremap gE <Cmd>lua require('telescope.builtin').diagnostics({fname_width=30})<CR>
nnoremap gi <Cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gs <Cmd>lua require('telescope.builtin').lsp_document_symbols({fname_width=10000, })<CR>
nnoremap gS <Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
nnoremap gci <Cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>
nnoremap gco <Cmd>lua require('telescope.builtin').lsp_outgoing_calls()<CR>

"==============================================================================
" NOTE TAKING
"==============================================================================
nnoremap <leader>zg <cmd>lua require("telescope").extensions.live_grep_args.live_grep_args({search_dirs = {vim.fn.expand("~/zettelkasten")}})<CR>
nnoremap <leader>zf <cmd>lua require("telescope.builtin").find_files({search_dirs = {vim.fn.expand("~/zettelkasten")}})<CR>
nnoremap <leader>zn :e ~/zettelkasten<CR>%

"==============================================================================
" MISC
"==============================================================================
nmap <silent> gx :!open <cWORD><cr>
nnoremap <C-p> :MarkdownPreviewToggle<CR>
nnoremap <leader>xb :Lexplore %:p:h<CR>
nnoremap <Leader>xx :Lexplore<CR>

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

lua << EOF
for k, v in ipairs(vim.fn.glob("~/.config/nvim/*.lua", false, true)) do
    dofile(v)
end
