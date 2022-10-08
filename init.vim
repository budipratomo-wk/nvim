syntax on
set incsearch
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
set cmdheight=2
set updatetime=300
set splitright 
set splitbelow
set re=0

call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'mcchrish/zenbones.nvim'        "Minimalist theme"
Plug 'sainnhe/everforest'            "Theme"
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'rktjmp/lush.nvim'              "Theme plugin required by zenbones"

"Telescope
Plug 'nvim-telescope/telescope-media-files.nvim' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
"LSP & Completions
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'williamboman/mason.nvim'        "LSP Installer'"
Plug 'hrsh7th/nvim-cmp'
Plug 'simrat39/symbols-outline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"
"Utilities
Plug 'kyazdani42/nvim-tree.lua'      "File explorer"
Plug 'phaazon/hop.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'renerocksai/telekasten.nvim'   "Note taking addon"
Plug 'renerocksai/calendar-vim'      "goes with telekasten"
Plug 'ahmedkhalf/project.nvim'
"Editing
Plug 'windwp/nvim-autopairs' "Add new row automatically when new line in brackets"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"Visual addons
Plug 'lukas-reineke/indent-blankline.nvim' 
Plug 'folke/twilight.nvim'           "Highlight only active paragraph"
Plug 'TaDaa/vimade'                   "Highlight active window"
Plug 'nvim-lua/popup.nvim'            "Required for Telescope media files"
Plug 'nvim-telescope/telescope-symbols.nvim' "Emoji picker"
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'danilamihailov/beacon.nvim'   "Add visibility when cursor moves"
Plug 'vimpostor/vim-lumen'           "Automatically change light and dark theme to follow system"
call plug#end()

"==============================================================================
" THEMES
"==============================================================================
" set bg=light
" colorscheme gruvbox
" colorscheme zenbones
colorscheme forestbones
" colorscheme neobones
" colorscheme nordbones
" colorscheme github
" colorscheme everforest


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


"==============================================================================
" LSP KEY BINDINGS
"==============================================================================

" Show hover
" nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
" Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
" Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <leader>fo <Cmd>lua vim.lsp.buf.formatting()<CR>
"==============================================================================
" TELESCOPE KEY BINDINGS
"==============================================================================
"Pickers
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').grep_files(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>gp <cmd>lua require('telescope').extensions.project.project(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fb <cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').get_ivy({}))<cr>

" LSP pickers
" nnoremap gd <Cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <Cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<CR>
nnoremap ge <Cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>
nnoremap gE <Cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>
nnoremap gim <Cmd>lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_ivy({}))<CR>
nnoremap go <Cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>
nnoremap gO <Cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_ivy({}))<CR>
nnoremap <C-p> <Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<CR>


"Git Telescope commands
nnoremap gbr <Cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_ivy({}))<CR>
nnoremap gbc <Cmd>lua require('telescope.builtin').git_bcommits(require('telescope.themes').get_ivy({}))<CR>
nnoremap gbm <Cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<CR>
nnoremap gbs <Cmd>lua require('telescope.builtin').git_status(require('telescope.themes').get_ivy({}))<CR>

"==============================================================================
" TELEKASTEN KEYBINDINGS
"==============================================================================

"Telekasten bindings
nnoremap <leader>zf :lua require('telekasten').find_notes(require('telescope.themes').get_ivy({}))<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes(require('telescope.themes').get_ivy({}))<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes(require('telescope.themes').get_ivy({}))<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link(require('telescope.themes').get_ivy({}))<CR>

" on hesitation, bring up the panel
nnoremap <leader>z :lua require('telekasten').panel(require('telescope.themes').get_ivy({}))<CR>

"==============================================================================
" MISC PLUGIN KEYBINDINGS
"==============================================================================

"Dim inactive range
nnoremap <leader>tt :Twilight<CR>
" Hop around
nnoremap <leader>hh :HopPattern<CR>
"
"NVIM Tcommands"
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>m :NvimTreeFindFile<CR>

"show outline
nnoremap <leader>oo :SymbolsOutline<CR>
"==============================================================================

lua <<EOF
--=============================================================================
--INITIALIZATIONS
--=============================================================================
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
require("nvim-autopairs").setup {}
require("symbols-outline").setup()
require'hop'.setup()
require('lualine').setup{
options = { theme = 'gruvbox' }
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
-- TELEKASTEN
--=============================================================================
local home = vim.fn.expand("~/zettelkasten")
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename = "title",
    -- file uuid type ("rand" or input for os.date()")
    uuid_type = "%Y%m%d%H%M",
    -- UUID separator
    uuid_sep = "-",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- skip telescope prompt for goto_today and goto_thisweek
    journal_auto_open = false,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- default sort option: 'filename', 'modified'
    sort = "filename",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    vaults = {
        vault2 = {
            -- alternate configuration for vault2 here. Missing values are defaulted to
            -- default values from telekasten.
            -- e.g.
            -- home = "/home/user/vaults/personal",
        },
    },

    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    media_previewer = "telescope-media-files",
})

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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver','dartls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
local ls= require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load({paths={"./snippets/flutter-snippets-master"}})
ls.filetype_extend("all",{"_"})
--

--=============================================================================
-- LSPSAGA 
--=============================================================================
local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>ot", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

--=============================================================================
-- SNIPPETS & COMPLETIONS 
--=============================================================================
-- luasnip setup
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
local default = {
   
   }
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
pickers={
   diagnostics={
   bufnr=0
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
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
}

local M = {}
M.setup = function(override_flag)
   if override_flag then
      default = require("core.utils").tbl_override_req("telescope", default)
   end

   telescope.setup(default)

   local extensions = { "themes", "terms","media_files", "live_grep_args", "project", "file_browser" }

   pcall(function()
      for _, ext in ipairs(extensions) do
         telescope.load_extension(ext)
      end
   end)
end

return M


